//
//  SectorTbarContainerView.m
//  Ictracker
//
//  Created by S. Cook on 1/20/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "SectorTbarContainerView.h"
#import "Utils.h"

@implementation SectorTbarContainerView

- (id)initWithDelegate:(id<SectorTBarDelegate>)sectorTbarDelegate
{
    CGRect frame = CGRectMake(
                              [Utils millimetersToPixels:70],
                              [Utils millimetersToPixels:13],
                              [Utils millimetersToPixels:126],
                              [Utils millimetersToPixels:126]);
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor redColor]];
    }
    return self;
}


@end
