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
        
        _action1 = [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_MEDIUM];
        [self addSubview:_action1];
        [_action1 setPosition:CGPointMake(
                                             [Utils millimetersToPixels:21],
                                             [Utils millimetersToPixels:16])];
        _action2 = [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_MEDIUM];
        [self addSubview:_action2];
        [_action2 setPosition:CGPointMake(
                                          [Utils millimetersToPixels:21],
                                          [Utils millimetersToPixels:22])];
        _action3 = [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_MEDIUM];
        [self addSubview:_action3];
        [_action3 setPosition:CGPointMake(
                                          [Utils millimetersToPixels:21],
                                          [Utils millimetersToPixels:28])];
        _action4 = [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_MEDIUM];
        [self addSubview:_action4];
        [_action4 setPosition:CGPointMake(
                                          [Utils millimetersToPixels:21],
                                          [Utils millimetersToPixels:34])];
        
        
        
        _par1 = [[ButtonView alloc] initWithName:@"P" delegate:self size:SMALL_CIRCLE];
        [self addSubview:_par1];
        [_par1 setPosition:CGPointMake(
                                        [Utils millimetersToPixels:1],
                                        [Utils millimetersToPixels:8])];
        _unit1 = [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_SMALL];
        [self addSubview:_unit1];
        [_unit1 setPosition:CGPointMake(
                                        [Utils millimetersToPixels:7],
                                        [Utils millimetersToPixels:8])];
        
        _par2 = [[ButtonView alloc] initWithName:@"P" delegate:self size:SMALL_CIRCLE];
        [self addSubview:_par2];
        [_par2 setPosition:CGPointMake(
                                       [Utils millimetersToPixels:1],
                                       [Utils millimetersToPixels:14.5])];
        _unit2 = [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_SMALL];
        [self addSubview:_unit2];
        [_unit2 setPosition:CGPointMake(
                                        [Utils millimetersToPixels:7],
                                        [Utils millimetersToPixels:14.5])];
        
        _par3 = [[ButtonView alloc] initWithName:@"P" delegate:self size:SMALL_CIRCLE];
        [self addSubview:_par3];
        [_par3 setPosition:CGPointMake(
                                       [Utils millimetersToPixels:1],
                                       [Utils millimetersToPixels:21])];
        _unit3 = [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_SMALL];
        [self addSubview:_unit3];
        [_unit3 setPosition:CGPointMake(
                                        [Utils millimetersToPixels:7],
                                        [Utils millimetersToPixels:21])];
        
        _par4 = [[ButtonView alloc] initWithName:@"P" delegate:self size:SMALL_CIRCLE];
        [self addSubview:_par4];
        [_par4 setPosition:CGPointMake(
                                       [Utils millimetersToPixels:1],
                                       [Utils millimetersToPixels:27.5])];
        _unit4 = [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_SMALL];
        [self addSubview:_unit4];
        [_unit4 setPosition:CGPointMake(
                                        [Utils millimetersToPixels:7],
                                        [Utils millimetersToPixels:27.5])];
        
        _par5 = [[ButtonView alloc] initWithName:@"P" delegate:self size:SMALL_CIRCLE];
        [self addSubview:_par5];
        [_par5 setPosition:CGPointMake(
                                       [Utils millimetersToPixels:1],
                                       [Utils millimetersToPixels:34])];
        _unit5 = [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_SMALL];
        [self addSubview:_unit5];
        [_unit5 setPosition:CGPointMake(
                                        [Utils millimetersToPixels:7],
                                        [Utils millimetersToPixels:34])];
        
        _action1.hidden = YES;
        _action2.hidden = YES;
        _action3.hidden = YES;
        _action4.hidden = YES;
        
        _par1.hidden = YES;
        _par2.hidden = YES;
        _par3.hidden = YES;
        _par4.hidden = YES;
        _par5.hidden = YES;
        
        _unit1.hidden = YES;
        _unit2.hidden = YES;
        _unit3.hidden = YES;
        _unit4.hidden = YES;
        _unit5.hidden = YES;
        
        _manyActions = 0;
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
    
    //Accountability box
    CGContextSetLineWidth(context, 1.0);
    CGContextSetFillColorWithColor(context, [UIColor yellowColor].CGColor);
    CGContextFillRect(context, CGRectMake(
                                          [Utils millimetersToPixels:25],
                                          [Utils millimetersToPixels:8],
                                          [Utils millimetersToPixels:12.5],
                                          [Utils millimetersToPixels:7]));
    CGContextAddRect(context, CGRectMake(
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
    
    // and now draw the Path!
    CGContextStrokePath(context);
}

- (void)setIsSelected:(BOOL)isSelected
{
    _isSelected = isSelected;
    if(_isSelected) {
        self.layer.borderColor = [[UIColor blueColor] CGColor];
        self.layer.borderWidth = 4.0;
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
//    NSLog(@"title:%@", title);
    [_titleButton setName:title];
}

- (void) addUnit:(NSString*)unitName
{
    if(_manyUnits<5) {
        _manyUnits++;
        ButtonView* parBtn;
        ButtonView* unitBtn;
        if(_manyUnits==1) {
            parBtn = _par1;
            unitBtn = _unit1;
        }
        if(_manyUnits==2) {
            parBtn = _par2;
            unitBtn = _unit2;
        }
        if(_manyUnits==3) {
            parBtn = _par3;
            unitBtn = _unit3;
        }
        if(_manyUnits==4) {
            parBtn = _par4;
            unitBtn = _unit4;
        }
        if(_manyUnits==5) {
            parBtn = _par5;
            unitBtn = _unit5;
        }
        parBtn.hidden = NO;
        unitBtn.hidden = NO;
        [unitBtn setName:unitName];
    }
}

- (void) addAction:(NSString*)actionName
{
    if(_manyActions<4) {
        _manyActions++;
        ButtonView* actionBtn;
        if(_manyActions==1) {
            actionBtn = _action1;
        }
        if(_manyActions==2) {
            actionBtn = _action2;
        }
        if(_manyActions==3) {
            actionBtn = _action3;
        }
        if(_manyActions==4) {
            actionBtn = _action4;
        }
        actionBtn.hidden = NO;
        [actionBtn setName:actionName];
    }
}

- (void) setIsRescue
{
    [self setTitle:@"RESCUE"];
    _isRescue = YES;
    _isRehab = NO;
    [_titleButton setNormalColor:[UIColor orangeColor]];
}

- (void) setIsRehab
{
    [self setTitle:@"REHAB"];
    _isRescue = NO;
    _isRehab = YES;
    [_titleButton setNormalColor:[UIColor blueColor]];
}

//Button delegate response
- (void) click:(id)selector
{
    [self setIsSelected:YES];
    if(selector==_titleButton) {
        [_sectorTbarDelegate onTitleClick:self];
    }
}

@end
