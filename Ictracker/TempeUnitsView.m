//
//  TempeUnits.m
//  Ictracker
//
//  Created by S. Cook on 1/29/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "TempeUnitsView.h"

@implementation TempeUnitsView

- (id)initWithDelegate:(id<CityUnitMenuDelegate>)cityUnitMenuDelegate
{
    
    NSDictionary *units = [[NSDictionary alloc] initWithObjectsAndKeys:
                           @[@"E271",
                             @"E272",
                             @"E273"],
                           [NSNumber numberWithInt:UNITTYPE_ENGINE],
                           @[@"L271"],
                           [NSNumber numberWithInt:UNITTYPE_LADDER],
                           @[@"BC271"],
                           [NSNumber numberWithInt:UNITTYPE_BC],
                           nil];
    
    self = [super initWithUnits:units delegate:cityUnitMenuDelegate];
    if (self) {
    }
    return self;
}

@end
