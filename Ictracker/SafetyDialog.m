//
//  SafetyDialog.m
//  Ictracker
//
//  Created by S. Cook on 1/24/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "SafetyDialog.h"
#import "Utils.h"
#import "ButtonView.h"

@implementation SafetyDialog

- (id)initWithDelegate:(id<SafetyButtonDelegate>)delegate safetyNames:(NSArray*)safetyNames
{
    CGRect frame = CGRectMake(0.0, 0.0, [Utils millimetersToPixels:31.0], [Utils millimetersToPixels:27.0]);
    self = [super initWithFrame:frame];
    if (self) {
        _delegate = delegate;
        self.backgroundColor = [UIColor lightGrayColor];
        self.layer.borderColor = [UIColor darkGrayColor].CGColor;
        self.layer.borderWidth = 1.5;
        self.layer.cornerRadius = 5.0;
        self.layer.masksToBounds = YES;
        
        double orig_x = 2;
        double orig_y = 8.5;
        double x = orig_x;
        double y = orig_y;
        double delta_y = 6;
        NSMutableArray* safteyButtons = [[NSMutableArray alloc] initWithCapacity:[safetyNames count]];
        for (NSString *safetyName in safetyNames) {
            ButtonView* btn = [[ButtonView alloc] initWithName:safetyName  delegate:self size:BUTTON_WIDE];
            [self addSubview:btn];
            [btn setPosition:CGPointMake([Utils millimetersToPixels:x], [Utils millimetersToPixels:y])];
            [safteyButtons addObject:btn];
            y+=delta_y;
        }
        [self setHeight:[Utils millimetersToPixels:y+0.5]];
        _safetyButtons = [NSArray arrayWithArray:safteyButtons];
    }
    return self;
}

- (void) setPosition:(CGPoint)position
{
    self.frame = CGRectMake(position.x, position.y, self.frame.size.width, self.frame.size.height);
}

- (void) setHeight:(CGFloat)height {
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y;
    CGFloat width = self.frame.size.width;
    self.frame = CGRectMake(x, y, width, height);
}

- (void) setSafety:(NSString *)safety {
    _curSafety = [NSString stringWithString:safety];
    
    for (ButtonView* safetyButton in _safetyButtons) {
        [safetyButton setIsHighlighted:NO];
    }
    
    for (ButtonView* safetyButton in _safetyButtons) {
        if([safetyButton.name isEqualToString:_curSafety]) {
            [safetyButton setIsHighlighted:YES];
            break;
        }
    }
}

- (void) click:(id)selector {
    ButtonView* btn = selector;
    NSString* newSafety = [btn name];
    
    if (![_curSafety isEqualToString:newSafety]) {
        [_delegate selectNewSafety:newSafety];
    } else {
        [_delegate cancelSafetyDialog];
    }
}

@end
