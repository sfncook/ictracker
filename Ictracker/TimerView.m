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
                              [Utils millimetersToPixels:157],
                              [Utils millimetersToPixels:3],
                              [Utils millimetersToPixels:40],
                              [Utils millimetersToPixels:10]);
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _curTime = [NSMutableString stringWithString:@"00:00:00"];
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                         target:self
                                       selector:@selector(updateTimer:)
                                       userInfo:nil
                                        repeats:YES];
        _startTime = [NSDate date];
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
    NSDateFormatter *df=[[NSDateFormatter alloc] init];
    [df setDateFormat:@"hh:mm:ss"];
    NSDate* curDate = [NSDate date];
    NSTimeInterval totalSeconds = [curDate timeIntervalSinceDate:_startTime];
    totalSeconds = abs(totalSeconds);
    
    int totalMinutes = floor(totalSeconds/60.0);
    int seconds = totalSeconds - (totalMinutes*60.0);
    int hours = floor(totalMinutes/60.0);
    int minutes = totalMinutes - (hours*60.0);
    
    NSString* hoursStr = @"";
    NSString* minutesStr = @"";
    NSString* secondsStr = @"";
    if (hours<10) {
        hoursStr = @"0";
    }
    if (minutes<10) {
        minutesStr = @"0";
    }
    if (seconds<10) {
        secondsStr = @"0";
    }
    _curTime = [NSMutableString stringWithFormat:@"%@%d:%@%d:%@%d", hoursStr, hours, minutesStr, minutes, secondsStr, seconds];
    [self setNeedsDisplay];
}

@end
