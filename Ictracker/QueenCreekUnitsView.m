//
//  QueenCreekUnitsView.m
//  Ictracker
//
//  Created by S. Cook on 1/29/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "QueenCreekUnitsView.h"
#import "Utils.h"

@implementation QueenCreekUnitsView

- (id)initWithDelegate:(id<CityUnitMenuDelegate>)cityUnitMenuDelegate
{
    NSDictionary *units = [[NSDictionary alloc] initWithObjectsAndKeys:
                           @[@"E411",
                             @"E412"],
                           [NSNumber numberWithInt:UNITTYPE_ENGINE],
                           @[@"BC411"],
                           [NSNumber numberWithInt:UNITTYPE_BC],
                           nil];
    
    self = [super initWithUnits:units delegate:cityUnitMenuDelegate];
    if (self) {
    }
    return self;
}

@end
