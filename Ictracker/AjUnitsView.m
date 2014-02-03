//
//  AjUnitsView.m
//  Ictracker
//
//  Created by S. Cook on 1/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "AjUnitsView.h"
#import "Utils.h"

@implementation AjUnitsView

- (id)initWithDelegate:(id<CityUnitMenuDelegate>)cityUnitMenuDelegate
{
    
    NSDictionary *units = [[NSDictionary alloc] initWithObjectsAndKeys:
                           @[@"E261",
                             @"E262",
                             @"E265"],
                           [NSNumber numberWithInt:UNITTYPE_ENGINE],
                           @[@"L263",
                             @"L264"],
                           [NSNumber numberWithInt:UNITTYPE_LADDER],
                           @[@"BC261"],
                           [NSNumber numberWithInt:UNITTYPE_BC],
                           @[@"WT261"],
                           [NSNumber numberWithInt:UNITTYPE_WATERTENDER],
                           @[@"BT261"],
                           [NSNumber numberWithInt:UNITTYPE_BRUSHTRUCK],
                           @[@"RH261"],
                           [NSNumber numberWithInt:UNITTYPE_REHAB],
                           nil];
    
    self = [super initWithUnits:units delegate:cityUnitMenuDelegate];
    if (self) {
//        self.backgroundColor = [UIColor redColor];
    }
    return self;
}



@end
