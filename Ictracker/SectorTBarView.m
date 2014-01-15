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

- (id)initWithPosition:(CGPoint)position
{
    CGRect frame = CGRectMake(position.x, position.y, [Utils millimetersToPixels:40], [Utils millimetersToPixels:40]);
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    
    // Draw them with a 2.0 stroke width so they are a bit more visible.
    CGContextSetLineWidth(context, 2.0);
    CGContextMoveToPoint(context, 0, [Utils millimetersToPixels:7]); //start at this point
    CGContextAddLineToPoint(context, self.frame.size.width, [Utils millimetersToPixels:7]); //draw to this point
    CGContextMoveToPoint(context, [Utils millimetersToPixels:20], [Utils millimetersToPixels:7]); //start at this point
    CGContextAddLineToPoint(context, [Utils millimetersToPixels:20], self.frame.size.height); //draw to this point
    
    // and now draw the Path!
    CGContextStrokePath(context);
}


@end
