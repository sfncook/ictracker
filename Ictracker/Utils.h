//
//  Utils.h
//  Ictracker
//
//  Created by S. Cook on 1/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <Foundation/Foundation.h>

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

@interface Utils : NSObject

+ (double) millimetersToPixels:(double)mm;
+ (double) windowWidth;
+ (double) windowHeight;

@end
