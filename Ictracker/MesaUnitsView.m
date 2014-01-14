//
//  MesaUnitsView.m
//  Ictracker
//
//  Created by S. Cook on 1/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "MesaUnitsView.h"
#import "Utils.h"

@implementation MesaUnitsView

- (id)init
{
    CGRect frame = CGRectMake(
                              [Utils millimetersToPixels:10],
                              [Utils millimetersToPixels:10],
                              [Utils millimetersToPixels:45],
                              [Utils windowWidth]-[Utils millimetersToPixels:15]);
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor purpleColor];
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
