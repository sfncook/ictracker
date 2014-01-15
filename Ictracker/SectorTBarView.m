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
        self.backgroundColor = [UIColor yellowColor];
        
        _mayDayButton = [[ButtonView alloc] initWithName:@"M" delegate:self size:SMALL_SQUARE];
        [self addSubview:_mayDayButton];
        [_mayDayButton setPosition:CGPointMake(
                                     [Utils millimetersToPixels:1],
                                     [Utils millimetersToPixels:1])];
        
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
        
        _acctButton = [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_MEDIUM];
        [self addSubview:_acctButton];
        [_acctButton setPosition:CGPointMake(
                                            [Utils millimetersToPixels:30],
                                            [Utils millimetersToPixels:9])];
        
        _action1 = [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_LARGE];
        [self addSubview:_action1];
        [_action1 setPosition:CGPointMake(
                                             [Utils millimetersToPixels:21],
                                             [Utils millimetersToPixels:9])];
        
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
    CGContextSetLineWidth(context, 2.0);
    CGContextMoveToPoint(context, 0, [Utils millimetersToPixels:7]); //start at this point
    CGContextAddLineToPoint(context, self.frame.size.width, [Utils millimetersToPixels:7]); //draw to this point
    CGContextMoveToPoint(context, [Utils millimetersToPixels:20], [Utils millimetersToPixels:7]); //start at this point
    CGContextAddLineToPoint(context, [Utils millimetersToPixels:20], self.frame.size.height); //draw to this point
    
    //Accountability box
    CGContextSetLineWidth(context, 1.0);
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
//    NSLog(@"Sector - unitName:%@", unitName);
}

//Button delegate response
- (void) click:(id)selector
{
    if(selector==_titleButton) {
        [_sectorTbarDelegate onTitleClick:self];
    }
}

@end
