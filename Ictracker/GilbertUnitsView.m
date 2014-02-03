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
    NSArray *engNames = @[@"E251",
                          @"E252",
                          @"E253"];
    
    NSArray *ladNames = @[@"L251",
                          @"L252"];
    
    NSArray *bcNames = @[@"BC291"];
    
    self = [super initWithEngNames:engNames
                          ladNames:ladNames
                           bcNames:bcNames
                          delegate:cityUnitMenuDelegate];
    if (self) {
//        self.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

@end
