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
    NSArray *engNames = @[@"E261",
                          @"E262",
                          @"E265"];
    
    NSArray *ladNames = @[@"L263",
                          @"L264"];
    
    NSArray *bcNames = @[@"BC261"];
    
    self = [super initWithEngNames:engNames
                          ladNames:ladNames
                           bcNames:bcNames
                          delegate:cityUnitMenuDelegate];
    if (self) {
//        self.backgroundColor = [UIColor redColor];
    }
    return self;
}



@end
