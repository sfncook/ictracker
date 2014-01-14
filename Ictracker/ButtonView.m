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

- (id)initWithName:(NSString*)name_ delegate:(id<ButtonClickDelegate>)clickDelegate_ size:(ButtonSize)size_
{
    CGRect frame;
    if(size_==BUTTON_LARGE) {
        frame = CGRectMake(0.0, 0.0, [Utils millimetersToPixels:12], [Utils millimetersToPixels:9]);
    } else if(size_==BUTTON_MEDIUM) {
        frame = CGRectMake(0.0, 0.0, [Utils millimetersToPixels:7], [Utils millimetersToPixels:5]);
    } else if(size_==BUTTON_WIDE) {
        frame = CGRectMake(0.0, 0.0, [Utils millimetersToPixels:27], [Utils millimetersToPixels:5]);
    }
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        _name = name_;
        _clickDelegate = clickDelegate_;
        _size = size_;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [self drawName];
}

- (void) drawName {
    if(_size==BUTTON_LARGE) {
        UIFont* font = [UIFont fontWithName:@"Georgia" size:18];
        CGRect textRect = CGRectMake(0.0, 11.0, self.frame.size.width, self.frame.size.height);
        
        /// Make a copy of the default paragraph style
        NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
        paragraphStyle.alignment = NSTextAlignmentCenter;
        
        NSDictionary *attributes = @{ NSFontAttributeName: font,
                                      NSParagraphStyleAttributeName: paragraphStyle };
        
        [self.name drawInRect:textRect withAttributes:attributes];
    } else if(_size==BUTTON_MEDIUM || _size==BUTTON_WIDE) {
        UIFont* font = [UIFont fontWithName:@"Georgia" size:14];
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
}

- (void) setPosition:(CGPoint)position
{
    self.frame = CGRectMake(position.x, position.y, self.frame.size.width, self.frame.size.height);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.backgroundColor = [UIColor darkGrayColor];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.backgroundColor = [UIColor lightGrayColor];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.backgroundColor = [UIColor lightGrayColor];
    [_clickDelegate click:self];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

@end
