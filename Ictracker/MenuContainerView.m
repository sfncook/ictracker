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
        
        _unitMenu = [[UnitMenu alloc] init];
        [self addSubview:_unitMenu];
        
        _sectorMenu = [[SectorMenu alloc] init];
        [self addSubview:_sectorMenu];
        
        [self showUnits];
    }
    return self;
}

- (void) showUnits
{
    _unitMenu.hidden = NO;
    _sectorMenu.hidden = YES;
}

- (void) showSectors
{
    _unitMenu.hidden = YES;
    _sectorMenu.hidden = NO;
}

@end
