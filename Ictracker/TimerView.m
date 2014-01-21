//
//  TimerView.m
//  Ictracker
//
//  Created by S. Cook on 1/20/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "TimerView.h"
#import "Utils.h"

@implementation TimerView

- (id)init
{
    CGRect frame = CGRectMake(
                              [Utils millimetersToPixels:166],
                              [Utils millimetersToPixels:3],
                              [Utils millimetersToPixels:30],
                              [Utils millimetersToPixels:10]);
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _curTime = [NSMutableString stringWithString:@"XX:XX"];
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                         target:self
                                       selector:@selector(updateTimer:)
                                       userInfo:nil
                                        repeats:NO];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [self drawTime];
}

- (void) drawTime {
    UIFont* font = [UIFont fontWithName:@"Georgia" size:40];
    CGRect textRect = CGRectMake([Utils millimetersToPixels:-1], [Utils millimetersToPixels:1], self.frame.size.width, self.frame.size.height);

    /// Make a copy of the default paragraph style
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    paragraphStyle.alignment = NSTextAlignmentRight;

    NSDictionary *attributes = @{ NSFontAttributeName: font,
                              NSParagraphStyleAttributeName: paragraphStyle };

    [_curTime drawInRect:textRect withAttributes:attributes];
}

- (void) updateTimer:(NSTimer *)timer {
    
}

@end
