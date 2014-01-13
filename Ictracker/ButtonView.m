//
//  ButtonView.m
//  Ictracker
//
//  Created by S. Cook on 1/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "ButtonView.h"
#import "Utils.h"

@implementation ButtonView

@synthesize name;
@synthesize size;
@synthesize clickDelegate;

- (id)initWithName:(NSString*)name_ delegate:(id<ButtonClickDelegate>)clickDelegate_ size:(ButtonSize)size_
{
    CGRect frame;
    if(size_==BUTTON_LARGE) {
        frame = CGRectMake(0.0, 0.0, [Utils millimetersToPixels:10], [Utils millimetersToPixels:7]);
    } else if(size_==BUTTON_MEDIUM) {
        frame = CGRectMake(0.0, 0.0, [Utils millimetersToPixels:7], [Utils millimetersToPixels:5]);
    }
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        self.name = name_;
        self.clickDelegate = clickDelegate_;
        self.size = size_;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [self drawName];
}

- (void) drawName {
    UIFont* font = [UIFont fontWithName:@"Georgia" size:30];
    CGFloat fontHeight = font.pointSize;
    CGFloat yOffset = (self.frame.size.height - fontHeight) / 2.0;
    CGRect textRect = CGRectMake(0, yOffset, self.frame.size.width, fontHeight);
    
    /// Make a copy of the default paragraph style
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{ NSFontAttributeName: font,
                                  NSParagraphStyleAttributeName: paragraphStyle };
    
    [self.name drawInRect:textRect withAttributes:attributes];
}

@end
