//
//  CityUnitsView.h
//  Ictracker
//
//  Created by S. Cook on 1/13/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonClickDelegate.h"
#import "CityUnitMenuDelegate.h"

typedef enum unittype {
    UNITTYPE_ZERO,//THIS MUST BE FIRST IN THIS LIST
    UNITTYPE_ENGINE,
    UNITTYPE_LADDER,
    UNITTYPE_BC,
    UNITTYPE_SQUAD,
    UNITTYPE_WATERTENDER,
    UNITTYPE_HAZMAT,
    UNITTYPE_UTILITY,
    UNITTYPE_CMDRVAN,
    UNITTYPE_BRUSHTRUCK,
    UNITTYPE_AIRLIGHTUNIT,
    UNITTYPE_REHAB,
    UNITTYPE_MANY//THIS MUST BE LAST IN THIS LIST
} UnitType;

@interface CityUnitsView : UIScrollView<ButtonClickDelegate>

@property (readonly, nonatomic)         id<CityUnitMenuDelegate> cityUnitMenuDelegate;

+ (NSMutableDictionary *)allUnits;

- (id)initWithUnits:(NSDictionary*)units delegate:(id<CityUnitMenuDelegate>)cityUnitMenuDelegate;

@end
