//
//  MenuContainerView.m
//  Ictracker
//
//  Created by S. Cook on 1/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "MenuContainerView.h"
#import "Utils.h"

@implementation MenuContainerView

@synthesize unitMenu;

- (id)init
{
    CGRect frame = CGRectMake(
                              [Utils millimetersToPixels:13],
                              [Utils millimetersToPixels:5],
                              [Utils millimetersToPixels:57],
                              [Utils windowWidth]-[Utils millimetersToPixels:5]);
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        
        self.unitMenu = [[UnitMenu alloc] init];
        [self addSubview:self.unitMenu];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
