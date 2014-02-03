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
    self = [super initWithFrame:CGRectMake(0, 0, 10, 10)];
    if (self) {
        _name = name_;
        _clickDelegate = clickDelegate_;
        [self setSize:size_];
        _defaultNormalColor  = [UIColor colorWithRed:0.95 green:0.98 blue:1.0 alpha:1.0];
        _defaultDownColor  = [UIColor darkGrayColor];
        _defaultBorderColor  = [UIColor colorWithRed:0.75 green:0.78 blue:1.0 alpha:1.0];
        _normalColor = _defaultNormalColor;
        _downColor = _defaultDownColor;
        _borderColor = _defaultBorderColor;
        if(_size==BUTTON_BLANK_WINDOW) {
            _normalColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:0.5];
            _downColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:0.5];
            _borderColor = [UIColor clearColor];
        }
        
        self.backgroundColor = _normalColor;
        self.layer.borderColor = [_borderColor CGColor];
        if(_size==BUTTON_WIDE_LG) {
            self.layer.borderWidth = 2.0;
        } else {
            self.layer.borderWidth = 1.5;
        }
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [self drawName];
}

- (void) drawName {
    if(_size==BUTTON_HEADER) {
        UIFont* font = [UIFont fontWithName:@"Arial" size:18];
        CGRect textRect = CGRectMake(0.0, 9.0, self.frame.size.width, self.frame.size.height);
        
        /// Make a copy of the default paragraph style
        NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
        paragraphStyle.alignment = NSTextAlignmentCenter;
        
        NSDictionary *attributes = @{ NSFontAttributeName: font,
                                      NSParagraphStyleAttributeName: paragraphStyle };
        
        [self.name drawInRect:textRect withAttributes:attributes];
    } else if(_size==BUTTON_LARGE) {
        UIFont* font = [UIFont fontWithName:@"Arial" size:18];
        CGRect textRect = CGRectMake(0.0, 11.0, self.frame.size.width, self.frame.size.height);
        
        /// Make a copy of the default paragraph style
        NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
        paragraphStyle.alignment = NSTextAlignmentCenter;
        
        NSDictionary *attributes = @{ NSFontAttributeName: font,
                                      NSParagraphStyleAttributeName: paragraphStyle };
        
        [self.name drawInRect:textRect withAttributes:attributes];
    } else if(_size==BUTTON_SMALL ||
              _size==BUTTON_MEDIUM ||
              _size==BUTTON_WIDE ||
              _size==SMALL_SQUARE ||
              _size==SMALL_CIRCLE ||
              _size==BUTTON_UNIT) {
        UIFont* font = [UIFont fontWithName:@"Arial" size:14];
        CGRect textRect = CGRectMake(0, 5.0, self.frame.size.width, self.frame.size.height);
        
        /// Make a copy of the default paragraph style
        NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
        paragraphStyle.alignment = NSTextAlignmentCenter;
        
        NSDictionary *attributes = @{ NSFontAttributeName: font,
                                      NSParagraphStyleAttributeName: paragraphStyle };
        
        [self.name drawInRect:textRect withAttributes:attributes];
    } else if(_size==BUTTON_WIDE_LG) {
        UIFont* font = [UIFont fontWithName:@"Arial" size:18];
        CGRect textRect = CGRectMake(0, 5.0, self.frame.size.width, self.frame.size.height);
        
        /// Make a copy of the default paragraph style
        NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
        paragraphStyle.alignment = NSTextAlignmentCenter;
        
        NSDictionary *attributes = @{ NSFontAttributeName: font,
                                      NSParagraphStyleAttributeName: paragraphStyle };
        
        [self.name drawInRect:textRect withAttributes:attributes];
    } else if(_size==CHECK_WIDE) {
        UIFont* font = [UIFont fontWithName:@"Arial" size:14];
        CGRect textRect = CGRectMake(0, 9.0, self.frame.size.width, self.frame.size.height);
        
        /// Make a copy of the default paragraph style
        NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
        paragraphStyle.alignment = NSTextAlignmentLeft;
        
        NSDictionary *attributes = @{ NSFontAttributeName: font,
                                      NSParagraphStyleAttributeName: paragraphStyle };
        
        NSMutableString* text;
        if(_isChecked) {
            text = [NSMutableString stringWithString:@" [X] "];
        } else {
            text = [NSMutableString stringWithString:@" [ ] "];
        }
        [text appendString:_name];
        [text drawInRect:textRect withAttributes:attributes];
    } else if(_size==BUTTON_BLANK_WINDOW) {
        //BLANK
    }
}

- (void) setSize:(ButtonSize)size {
    _size = size;
    float x = self.frame.origin.x;
    float y = self.frame.origin.y;
    self.layer.cornerRadius = 5.0;
    self.layer.masksToBounds = YES;
    if(size==BUTTON_HEADER) {
        self.frame = CGRectMake(x, y, [Utils millimetersToPixels:18], [Utils millimetersToPixels:7]);
    } else if(size==BUTTON_LARGE) {
        self.frame = CGRectMake(x, y, [Utils millimetersToPixels:12], [Utils millimetersToPixels:9]);
    } else if(size==BUTTON_MEDIUM) {
        self.frame = CGRectMake(x, y, [Utils millimetersToPixels:18], [Utils millimetersToPixels:5]);
    } else if(size==BUTTON_SMALL) {
        self.frame = CGRectMake(x, y, [Utils millimetersToPixels:7], [Utils millimetersToPixels:5]);
    } else if(size==BUTTON_WIDE) {
        self.frame = CGRectMake(x, y, [Utils millimetersToPixels:27], [Utils millimetersToPixels:5]);
    } else if(size==BUTTON_WIDE_LG) {
        self.frame = CGRectMake(x, y, [Utils millimetersToPixels:29], [Utils millimetersToPixels:6]);
    } else if(size==CHECK_WIDE) {
        self.frame = CGRectMake(x, y, [Utils millimetersToPixels:55], [Utils millimetersToPixels:6]);
    } else if(size==SMALL_SQUARE) {
        self.frame = CGRectMake(x, y, [Utils millimetersToPixels:5], [Utils millimetersToPixels:5]);
    } else if(size==SMALL_CIRCLE) {
        self.frame = CGRectMake(x, y, [Utils millimetersToPixels:5], [Utils millimetersToPixels:5]);
        self.layer.cornerRadius = [Utils millimetersToPixels:2.5];
        self.layer.masksToBounds = YES;
    } else if(size==BUTTON_UNIT) {
        self.frame = CGRectMake(x, y, [Utils millimetersToPixels:9], [Utils millimetersToPixels:5]);
    } else if(size==BUTTON_BLANK_WINDOW) {
        self.frame = CGRectMake(x, y, [Utils windowHeight], [Utils windowWidth]);
        self.layer.cornerRadius = [Utils millimetersToPixels:0.0];
        self.layer.masksToBounds = YES;
    }
}

- (void) setPosition:(CGPoint)position
{
    self.frame = CGRectMake(position.x, position.y, self.frame.size.width, self.frame.size.height);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.backgroundColor = _downColor;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.backgroundColor = _normalColor;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(_size==CHECK_WIDE) {
        _isChecked = !_isChecked;
    }
    self.backgroundColor = _normalColor;
    [_clickDelegate click:self];
}

- (void) setNormalColor:(UIColor *)normalColor
{
    _normalColor = normalColor;
    self.backgroundColor = _normalColor;
}

- (void) setBorderColor:(UIColor *)borderColor
{
    self.layer.borderColor = borderColor.CGColor;
    _borderColor = borderColor;
}

- (void) setName:(NSString *)name
{
    _name = name;
    [self setNeedsDisplay];
}

- (void) setIsHighlighted:(BOOL)isHighlighted
{
    _isHighlighted = isHighlighted;
    if(isHighlighted) {
        [self setBorderColor:[UIColor colorWithRed:0.35 green:0.5 blue:1.0 alpha:1.0]];
        [self setNormalColor:[UIColor colorWithRed:0.8 green:0.9 blue:1.0 alpha:1.0]];
    } else {
        [self setBorderColor:_defaultBorderColor];
        [self setNormalColor:_defaultNormalColor];
    }
}

@end
