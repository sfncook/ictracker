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

- (id)initWithDelegate:(id<CityUnitMenuDelegate>)cityUnitMenuDelegate
{
    
    NSDictionary *units = [[NSDictionary alloc] initWithObjectsAndKeys:
                           [NSNumber numberWithInt:UNITTYPE_ENGINE],
                           @[@"E251",
                             @"E252",
                             @"E253"],
                           [NSNumber numberWithInt:UNITTYPE_LADDER],
                           @[@"L251",
                             @"L252"],
                           [NSNumber numberWithInt:UNITTYPE_BC],
                           @[@"BC291"],
                           nil];
    
    self = [super initWithUnits:units delegate:cityUnitMenuDelegate];
    if (self) {
//        self.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

@end
