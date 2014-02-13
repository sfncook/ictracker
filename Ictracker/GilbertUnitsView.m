//
//  GilbertUnitsView.m
//  Ictracker
//
//  Created by S. Cook on 1/13/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "GilbertUnitsView.h"
#import "Utils.h"

@implementation GilbertUnitsView

- (id)initWithFrame:(CGRect)frame delegate:(id<CityUnitMenuDelegate>)cityUnitMenuDelegate
{
    
    NSDictionary *units = [[NSDictionary alloc] initWithObjectsAndKeys:
                           @[@"E251",
                             @"E252",
                             @"E253"],
                           [NSNumber numberWithInt:UNITTYPE_ENGINE],
                           @[@"L251",
                             @"L252"],
                           [NSNumber numberWithInt:UNITTYPE_LADDER],
                           @[@"BC291"],
                           [NSNumber numberWithInt:UNITTYPE_BC],
                           nil];
    
    self = [super initWithFrame:frame units:units delegate:cityUnitMenuDelegate];
    if (self) {
//        self.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

@end
