//
//  TempeUnits.m
//  Ictracker
//
//  Created by S. Cook on 1/29/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "TempeUnitsView.h"
#import "Utils.h"

@implementation TempeUnitsView

- (id)initWithFrame:(CGRect)frame delegate:(id<CityUnitMenuDelegate>)cityUnitMenuDelegate
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
    
    self = [super initWithFrame:frame units:units delegate:cityUnitMenuDelegate];
    if (self) {
    }
    return self;
}

@end
