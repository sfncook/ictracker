//
//  ChandlerUnitsView.m
//  Ictracker
//
//  Created by S. Cook on 2/2/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "ChandlerUnitsView.h"

@implementation ChandlerUnitsView

- (id)initWithDelegate:(id<CityUnitMenuDelegate>)cityUnitMenuDelegate
{
    
    NSDictionary *units = [[NSDictionary alloc] initWithObjectsAndKeys:
                           @[@"E282",
                             @"E283",
                             @"E284",
                             @"E285",
                             @"E286",
                             @"E287",
                             @"E288",
                             @"E289",],
                           [NSNumber numberWithInt:UNITTYPE_ENGINE],
                           @[@"L281",
                             @"L283"],
                           [NSNumber numberWithInt:UNITTYPE_LADDER],
                           @[@"BC281",
                             @"BC282"],
                           [NSNumber numberWithInt:UNITTYPE_BC],
                           nil];
    
    self = [super initWithUnits:units delegate:cityUnitMenuDelegate];
    if (self) {
    }
    return self;
}

@end
