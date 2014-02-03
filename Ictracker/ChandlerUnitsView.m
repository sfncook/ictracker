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
    NSArray *engNames = @[@"E282",
                          @"E283",
                          @"E284",
                          @"E285",
                          @"E286",
                          @"E287",
                          @"E288",
                          @"E289",];
    
    NSArray *ladNames = @[@"L281",
                          @"L283"
                          ];
    
    NSArray *bcNames = @[@"BC281",
                         @"BC282"];
    
    self = [super initWithEngNames:engNames ladNames:ladNames bcNames:bcNames delegate:cityUnitMenuDelegate];
    if (self) {
    }
    return self;
}

@end
