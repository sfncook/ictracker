//
//  AllCitiesUnitsView.m
//  Ictracker
//
//  Created by S. Cook on 1/29/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "AllCitiesUnitsView.h"

@implementation AllCitiesUnitsView

- (id)initWithDelegate:(id<CityUnitMenuDelegate>)cityUnitMenuDelegate
{
    NSArray *engNames = @[@"E201",
                          @"E202",
                          @"E203",
                          @"E204",
                          @"E205",
                          @"E206",
                          @"E207",
                          @"E208",
                          @"E209",
                          @"E210",
                          @"E211",
                          @"E212",
                          @"E213",
                          @"E215",
                          @"E216",
                          @"E217",
                          @"E218",
                          @"E219",
                          @"E220",
                          @"E221",
                          @"E222",
                          @"E223",
                          @"E224",
                          @"E225",
                          @"E226",
                          @"E227",
                          @"E228",
                          @"E229",
                          @"E261",
                          @"E262",
                          @"E265",
                          @"E411",
                          @"E412"];
    
    NSArray *ladNames = @[@"L201",
                          @"L204",
                          @"L206",
                          @"L209",
                          @"L214",
                          @"L220",
                          @"L251",
                          @"L252",
                          @"L263",
                          @"L264"
                          ];
    
    NSArray *bcNames = @[@"B201",
                         @"B202",
                         @"B203",
                         @"B261",
                         @"B291",
                         @"B411"];
    
    self = [super initWithEngNames:engNames ladNames:ladNames bcNames:bcNames delegate:cityUnitMenuDelegate];
    if (self) {
    }
    return self;
}

@end

