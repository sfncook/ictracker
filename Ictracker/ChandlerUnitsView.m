//
//  ChandlerUnitsView.m
//  Ictracker
//
//  Created by S. Cook on 2/2/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "ChandlerUnitsView.h"
#import "Utils.h"

@implementation ChandlerUnitsView

- (id)initWithFrame:(CGRect)frame delegate:(id<CityUnitMenuDelegate>)cityUnitMenuDelegate
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
                           @[@"SQ283",],
                           [NSNumber numberWithInt:UNITTYPE_SQUAD],
                           @[@"HZ283",],
                           [NSNumber numberWithInt:UNITTYPE_HAZMAT],
                           @[@"BT284",],
                           [NSNumber numberWithInt:UNITTYPE_BRUSHTRUCK],
                           @[@"UT288",],
                           [NSNumber numberWithInt:UNITTYPE_UTILITY],
                           nil];
    
    self = [super initWithFrame:frame units:units delegate:cityUnitMenuDelegate];
    if (self) {
    }
    return self;
}

@end
