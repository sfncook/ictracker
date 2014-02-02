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
    NSArray *engNames = @[@"E271",
                          @"E272",
                          @"E273"];
    
    NSArray *ladNames = @[@"L271"
                          ];
    
    NSArray *bcNames = @[@"BC271"];
    
    self = [super initWithEngNames:engNames ladNames:ladNames bcNames:bcNames delegate:cityUnitMenuDelegate];
    if (self) {
    }
    return self;
}

@end
