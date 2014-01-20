//
//  SectorTBarView.m
//  Ictracker
//
//  Created by S. Cook on 1/14/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "SectorTBarView.h"
#import "Utils.h"

@implementation SectorTBarView

- (id)initWithPosition:(CGPoint)position delegate:(id<SectorTBarDelegate>)sectorTbarDelegate_
{
    CGRect frame = CGRectMake(position.x, position.y, [Utils millimetersToPixels:40], [Utils millimetersToPixels:40]);
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        _mayDayButton = [[ButtonView alloc] initWithName:@"M" delegate:self size:SMALL_SQUARE];
        [self addSubview:_mayDayButton];
        [_mayDayButton setPosition:CGPointMake(
                                     [Utils millimetersToPixels:1],
                                     [Utils millimetersToPixels:1])];
        [_mayDayButton setNormalColor:[UIColor colorWithRed:1.0 green:0.54 blue:0.54 alpha:1.0]];
        
        _titleButton = [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_WIDE];
        [self addSubview:_titleButton];
        [_titleButton setPosition:CGPointMake(
                                               [Utils millimetersToPixels:6.5],
                                               [Utils millimetersToPixels:1])];
        [_titleButton setNormalColor:[UIColor whiteColor]];
        
        _psiButton = [[ButtonView alloc] initWithName:@"PSI" delegate:self size:SMALL_SQUARE];
        [self addSubview:_psiButton];
        [_psiButton setPosition:CGPointMake(
                                              [Utils millimetersToPixels:34],
                                              [Utils millimetersToPixels:1])];
        
        _acctButton = [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_SMALL];
        [self addSubview:_acctButton];
        [_acctButton setPosition:CGPointMake(
                                            [Utils millimetersToPixels:30],
                                            [Utils millimetersToPixels:9])];
        
        _actionButtons = [NSArray arrayWithObjects:
                          [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_MEDIUM],
                          [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_MEDIUM],
                          [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_MEDIUM],
                          [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_MEDIUM],
                          nil];
        double y = 16;
        for (ButtonView* btn in _actionButtons) {
            [self addSubview:btn];
            [btn setPosition:CGPointMake(
                                        [Utils millimetersToPixels:21],
                                        [Utils millimetersToPixels:y])];
            y+=6.0;
            btn.hidden = YES;
        }
        
        _parButtons = [NSArray arrayWithObjects:
                        [[ButtonView alloc] initWithName:@"P" delegate:self size:SMALL_CIRCLE],
                        [[ButtonView alloc] initWithName:@"P" delegate:self size:SMALL_CIRCLE],
                        [[ButtonView alloc] initWithName:@"P" delegate:self size:SMALL_CIRCLE],
                        [[ButtonView alloc] initWithName:@"P" delegate:self size:SMALL_CIRCLE],
                        [[ButtonView alloc] initWithName:@"P" delegate:self size:SMALL_CIRCLE],
                          nil];
        y = 8;
        for (ButtonView* btn in _parButtons) {
            [self addSubview:btn];
            [btn setPosition:CGPointMake(
                                         [Utils millimetersToPixels:1],
                                         [Utils millimetersToPixels:y])];
            y+=6.5;
            btn.hidden = YES;
        }
        
        _unitButtons = [NSArray arrayWithObjects:
                       [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_SMALL],
                       [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_SMALL],
                       [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_SMALL],
                       [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_SMALL],
                       [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_SMALL],
                       nil];
        y = 8;
        for (ButtonView* btn in _unitButtons) {
            [self addSubview:btn];
            [btn setPosition:CGPointMake(
                                         [Utils millimetersToPixels:7],
                                         [Utils millimetersToPixels:y])];
            y+=6.5;
            btn.hidden = YES;
        }
        _manyUnits = 0;
        
        _sectorTbarDelegate = sectorTbarDelegate_;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    
    //Draw the "T-Bar"
    CGContextSetLineWidth(context, 1.0);
    CGContextMoveToPoint(context, 0, [Utils millimetersToPixels:7]); //start at this point
    CGContextAddLineToPoint(context, self.frame.size.width, [Utils millimetersToPixels:7]); //draw to this point
    CGContextMoveToPoint(context, [Utils millimetersToPixels:20], [Utils millimetersToPixels:7]); //start at this point
    CGContextAddLineToPoint(context, [Utils millimetersToPixels:20], self.frame.size.height); //draw to this point
    CGContextStrokePath(context);
    
    if(!_isRehab && !_isRescue){//Accountability box
        CGContextSetLineWidth(context, 1.0);
        CGContextSetFillColorWithColor(context, [UIColor yellowColor].CGColor);
        CGContextFillRect(context, CGRectMake(
                                              [Utils millimetersToPixels:25],
                                              [Utils millimetersToPixels:8],
                                              [Utils millimetersToPixels:12.5],
                                              [Utils millimetersToPixels:7]));
        

        //Draw the '@' symbol
        UIFont* font = [UIFont fontWithName:@"Georgia" size:20];
        CGRect textRect = CGRectMake(
                                     [Utils millimetersToPixels:25.5],
                                     [Utils millimetersToPixels:8.5],
                                     [Utils millimetersToPixels:4],
                                     [Utils millimetersToPixels:7.5]);
        NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
        paragraphStyle.alignment = NSTextAlignmentCenter;
        
        NSDictionary *attributes = @{ NSFontAttributeName: font,
                                      NSParagraphStyleAttributeName: paragraphStyle };
        
        [@"@" drawInRect:textRect withAttributes:attributes];
    }
    
    // and now draw the Path!
    CGContextStrokePath(context);
}

- (void)setIsSelected:(BOOL)isSelected
{
    _isSelected = isSelected;
    if(_isSelected) {
        self.layer.borderColor = [[UIColor blueColor] CGColor];
        self.layer.borderWidth = 2.5;
        [_sectorTbarDelegate onSelected:self];
    } else {
        self.layer.borderWidth = 0.0;
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(!_isSelected) {
        [self setIsSelected:YES];
    }
}

- (void) setTitle:(NSString*)title
{
    [_titleButton setName:title];
    if([title isEqualToString:@"REHAB"]) {
        [_titleButton setNormalColor:[UIColor blueColor]];
    } else if([title isEqualToString:@"RESCUE"]) {
        [_titleButton setNormalColor:[UIColor orangeColor]];
    } else {
        [_titleButton setNormalColor:[UIColor colorWithRed:0.95 green:0.98 blue:1.0 alpha:1.0]];
    }
}

- (void) addUnit:(NSString*)unitName
{
    if(_manyUnits<5) {
        ButtonView* unitBtn = [_unitButtons objectAtIndex:_manyUnits];
        ButtonView* parBtn = [_parButtons objectAtIndex:_manyUnits];
        _manyUnits++;
        unitBtn.hidden = NO;
        parBtn.hidden = NO;
        [unitBtn setName:unitName];
    }
}

- (void) addAction:(NSString*)actionName
{
    if(_manyActions<4) {
        ButtonView* actionBtn = [_actionButtons objectAtIndex:_manyActions];
        _manyActions++;
        actionBtn.hidden = NO;
        [actionBtn setName:actionName];
    }
}

- (void) setCurActionItemIndex:(int)curActionItemIndex
{
    _curActionItemIndex = curActionItemIndex;
}

- (void) setIsRescue
{
    [self setTitle:@"RESCUE"];
    _isRescue = YES;
    _isRehab = NO;
    [_titleButton setNormalColor:[UIColor orangeColor]];
    _acctButton.hidden = YES;
}

- (void) setIsRehab
{
    [self setTitle:@"REHAB"];
    _isRescue = NO;
    _isRehab = YES;
    [_titleButton setNormalColor:[UIColor blueColor]];
    _acctButton.hidden = YES;
}

//Button delegate response
- (void) click:(id)selector
{
    [self setIsSelected:YES];
    if(selector==_titleButton) {
        [_sectorTbarDelegate onTitleClick:self];
    }
    if([_actionButtons containsObject:selector]) {
        [_sectorTbarDelegate onActionClick:self];
    }
    if(selector==_acctButton) {
        [_sectorTbarDelegate onActionableUnitClick:self];
    }
    if([_unitButtons containsObject:selector]) {
        [_sectorTbarDelegate onUnitClick:self];
    }
}

@end
