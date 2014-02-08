//
//  SectorTBarView.m
//  Ictracker
//
//  Created by S. Cook on 1/14/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "SectorTBarView.h"
#import "Utils.h"
#import "Transaction.h"

@implementation SectorTBarView

- (id)initWithPosition:(CGPoint)position delegate:(id<SectorTBarDelegate>)sectorTbarDelegate_
{
    CGRect frame = CGRectMake(position.x, position.y, [Utils millimetersToPixels:40], [Utils millimetersToPixels:40]);
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _transLogger = [TransactionLogger transLogger];
        
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
        
        _psiButton = [[ButtonView alloc] initWithName:@"PSI" delegate:self size:BUTTON_SMALL];
        [self addSubview:_psiButton];
        [_psiButton setPosition:CGPointMake(
                                              [Utils millimetersToPixels:32],
                                              [Utils millimetersToPixels:1])];
        
        _acctButton = [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_UNIT];
        [self addSubview:_acctButton];
        [_acctButton setPosition:CGPointMake(
                                            [Utils millimetersToPixels:28],
                                            [Utils millimetersToPixels:9])];
        
        _actionButtons = [NSArray arrayWithObjects:
                          [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_MEDIUM],
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
            [btn setNormalColor:[UIColor clearColor]];
        }
        [[_actionButtons objectAtIndex:0] setHidden:NO];
        
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
                       [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_UNIT],
                       [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_UNIT],
                       [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_UNIT],
                       [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_UNIT],
                       [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_UNIT],
                       nil];
        y = 8;
        for (ButtonView* btn in _unitButtons) {
            [self addSubview:btn];
            [btn setPosition:CGPointMake(
                                         [Utils millimetersToPixels:7],
                                         [Utils millimetersToPixels:y])];
            y+=6.5;
            btn.hidden = YES;
            [btn setNormalColor:[UIColor clearColor]];
        }
        [[_unitButtons objectAtIndex:0] setHidden:NO];
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
    
    if(!_isRehab){//Accountability box
        CGContextSetLineWidth(context, 1.0);
        CGContextSetFillColorWithColor(context, [UIColor yellowColor].CGColor);
        CGContextFillRect(context, CGRectMake(
                                              [Utils millimetersToPixels:23],
                                              [Utils millimetersToPixels:8],
                                              [Utils millimetersToPixels:14.5],
                                              [Utils millimetersToPixels:7]));
        

        //Draw the '@' symbol
        UIFont* font = [UIFont fontWithName:@"Georgia" size:20];
        CGRect textRect = CGRectMake(
                                     [Utils millimetersToPixels:23.5],
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
    
    if (_isSelected) {
        CGContextSetFillColorWithColor(context, [UIColor colorWithRed:0.75 green:0.85 blue:1.0 alpha:1.0].CGColor);
        CGContextFillRect(context, CGRectMake(
                                              0,
                                              0,
                                              [Utils millimetersToPixels:40],
                                              [Utils millimetersToPixels:7]));
    }
    
    // and now draw the Path!
    CGContextStrokePath(context);
}

- (void)setIsSelected:(BOOL)isSelected
{
    _isSelected = isSelected;
    if(_isSelected) {
        self.layer.borderColor =  [UIColor colorWithRed:0.35 green:0.5 blue:1.0 alpha:1.0].CGColor;
        self.layer.borderWidth = 1.0;
    } else {
        self.layer.borderWidth = 0.0;
        [_acctButton setIsHighlighted:NO];
    }
    [self setNeedsDisplay];
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
        [_sectorTbarDelegate onSelected:self];
    }
}

- (void) addUnit:(NSString*)unitName
{
    if([_acctButton isHighlighted]) {
        Transaction* tx = [Transaction transactionWithType:TRANSTYPE_ADD_UNIT_TO_ACCT date:[NSDate date] param:unitName, self, nil];
        [_transLogger addTransaction:tx];
        
        [_acctButton setIsHighlighted:NO];
        [_acctButton setName:unitName];
    } else if(_manyUnits<5) {
        Transaction* tx = [Transaction transactionWithType:TRANSTYPE_ADD_UNIT_TO_SECTOR date:[NSDate date] param:unitName, self, nil];
        [_transLogger addTransaction:tx];
        
        ButtonView* unitBtn = [_unitButtons objectAtIndex:_manyUnits];
        ButtonView* parBtn = [_parButtons objectAtIndex:_manyUnits];
        unitBtn.hidden = NO;
        parBtn.hidden = NO;
        [unitBtn setName:unitName];
        [unitBtn setNormalColor:[UIColor colorWithRed:0.95 green:0.98 blue:1.0 alpha:1.0]];
        if(_manyUnits<4) {
            [[_unitButtons objectAtIndex:_manyUnits+1] setHidden:NO];
        }
        _manyUnits++;
    }
}

- (void) addAction:(NSString*)actionName
{
    int MAX_ACTIONS = 4;
    if (_isRehab) {
        MAX_ACTIONS = 5;
    }
    if(_manyActions<MAX_ACTIONS) {
        Transaction* tx = [Transaction transactionWithType:TRANSTYPE_ADD_ACTION_TO_SECTOR date:[NSDate date] param:actionName, self, nil];
        [_transLogger addTransaction:tx];
        
        ButtonView* actionBtn = [_actionButtons objectAtIndex:_manyActions];
        actionBtn.hidden = NO;
        [actionBtn setName:actionName];
        [actionBtn setNormalColor:[UIColor colorWithRed:0.95 green:0.98 blue:1.0 alpha:1.0]];
        if(_manyActions<MAX_ACTIONS-1) {
            [[_actionButtons objectAtIndex:_manyActions+1] setHidden:NO];
        }
        _manyActions++;
    }
}

- (void) setCurActionItemIndex:(int)curActionItemIndex
{
    _curActionItemIndex = curActionItemIndex;
}

- (void) moveActionButtonsUp {
    double y = 8;
    for (ButtonView* btn in _actionButtons) {
        [btn setPosition:CGPointMake(
                                     [Utils millimetersToPixels:21],
                                     [Utils millimetersToPixels:y])];
        y+=6.5;
    }
}

- (void) moveActionButtonsDown {
    double y = 16;
    for (ButtonView* btn in _actionButtons) {
        [btn setPosition:CGPointMake(
                                     [Utils millimetersToPixels:21],
                                     [Utils millimetersToPixels:y])];
        y+=6.0;
    }
}

- (void) setTitle:(NSString*)title
{
    Transaction* tx = [Transaction transactionWithType:TRANSTYPE_SET_SECTOR_REHAB date:[NSDate date] param:title, self, nil];
    [_transLogger addTransaction:tx];
    [_titleButton setName:title];
    if ([title isEqualToString:@"REHAB"]) {
        _isRescue = NO;
        _isRehab = YES;
        [_titleButton setNormalColor:[UIColor colorWithRed:0.5 green:0.85 blue:1.0 alpha:1.0]];
        _acctButton.hidden = YES;
        _psiButton.hidden = YES;
        [self moveActionButtonsUp];
        //Check if we need to show the bottom action button
        ButtonView* secondToLastBtn = [_actionButtons objectAtIndex:3];
        if (!secondToLastBtn.hidden) {
            ButtonView* bottomBtn = [_actionButtons lastObject];
            bottomBtn.hidden = NO;
        }
    } else if ([title isEqualToString:@"RESCUE"]) {
        _isRescue = YES;
        _isRehab = NO;
        [_titleButton setNormalColor:[UIColor orangeColor]];
        _acctButton.hidden = NO;
        _psiButton.hidden = NO;
        [self moveActionButtonsDown];
        //Always hide the bottom action button
        ButtonView* bottomBtn = [_actionButtons lastObject];
        bottomBtn.hidden = YES;
    } else {
        _isRescue = NO;
        _isRehab = NO;
        [_titleButton setNormalColor:[UIColor colorWithRed:0.95 green:0.98 blue:1.0 alpha:1.0]];
        _acctButton.hidden = NO;
        _psiButton.hidden = NO;
        [self moveActionButtonsDown];
        //Always hide the bottom action button
        ButtonView* bottomBtn = [_actionButtons lastObject];
        bottomBtn.hidden = YES;
    }
    [self setNeedsDisplay];
}

- (void) setIsRescue
{
    [self setTitle:@"RESCUE"];
}

- (void) setIsRehab
{
    [self setTitle:@"REHAB"];
}

- (void) setPsi:(NSString*)psi {
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterNoStyle];
    NSNumber * psiNum = [f numberFromString:psi];
//    psiNum = [NSNumber numberWithInt:psiNum.intValue/100];
    if (psiNum.intValue<1500) {
        [_psiButton setNormalColor:[UIColor redColor]];
    } else if (psiNum.intValue<3000) {
        [_psiButton setNormalColor:[UIColor yellowColor]];
    } else {
        [_psiButton setNormalColor:[UIColor greenColor]];
    }
    [_psiButton setName:psiNum.stringValue];
}

//Button delegate response
- (void) click:(id)selector
{
    [_acctButton setIsHighlighted:NO];
    [self setIsSelected:YES];
    [_sectorTbarDelegate onSelected:self];
    if(selector==_titleButton) {
        [_sectorTbarDelegate onTitleClick:self];
    }
    if([_actionButtons containsObject:selector]) {
        [_sectorTbarDelegate onActionClick:self];
    }
    if(selector==_acctButton) {
        [_acctButton setIsHighlighted:YES];
        [_sectorTbarDelegate onActionableUnitClick:self];
    }
    if([_unitButtons containsObject:selector]) {
        [_sectorTbarDelegate onUnitClick:self];
    }
    if(_psiButton==selector) {
        [_sectorTbarDelegate onPsiClickWithSectorTBar:self];
    }
    if ([_parButtons containsObject:selector]) {
        [_sectorTbarDelegate onParClickWithSectorTBar:selector];
    }
    
}

@end
