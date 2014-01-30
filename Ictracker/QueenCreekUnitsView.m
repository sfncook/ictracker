//
//  QueenCreekUnitsView.m
//  Ictracker
//
//  Created by S. Cook on 1/29/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "QueenCreekUnitsView.h"

@implementation QueenCreekUnitsView

- (id)initWithDelegate:(id<CityUnitMenuDelegate>)cityUnitMenuDelegate
{
    NSArray *engNames = @[@"E411",
                          @"E412"];
    
    NSArray *ladNames = @[@"L411"];
    
    NSArray *bcNames = @[@"B411"];
    
    self = [super initWithEngNames:engNames ladNames:ladNames bcNames:bcNames delegate:cityUnitMenuDelegate];
    if (self) {
    }
    return self;
}

@end
