//
//  MesaUnitsView.m
//  Ictracker
//
//  Created by S. Cook on 1/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "MesaUnitsView.h"
#import "Utils.h"

@implementation MesaUnitsView

- (id)initWithDelegate:(id<CityUnitMenuDelegate>)cityUnitMenuDelegate
{
    NSDictionary *units = [[NSDictionary alloc] initWithObjectsAndKeys:
                           [NSNumber numberWithInt:UNITTYPE_ENGINE],
                           @[@"E201",
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
                             @"E229"],
                           [NSNumber numberWithInt:UNITTYPE_LADDER],
                           @[@"L201",
                             @"L204",
                             @"L206",
                             @"L209",
                             @"L214",
                             @"L220"],
                           [NSNumber numberWithInt:UNITTYPE_BC],
                           @[@"BC201",
                             @"BC202",
                             @"BC203"],
                           nil];
    
    self = [super initWithUnits:units delegate:cityUnitMenuDelegate];
    if (self) {
//        self.backgroundColor = [UIColor purpleColor];
    }
    return self;
}

@end
