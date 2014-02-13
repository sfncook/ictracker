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

@interface CityUnitsView : UIScrollView<ButtonClickDelegate>

@property (readonly, nonatomic)         id<CityUnitMenuDelegate> cityUnitMenuDelegate;

+ (NSMutableDictionary *)allUnits;

- (id)initWithFrame:(CGRect)frame units:(NSDictionary*)units delegate:(id<CityUnitMenuDelegate>)cityUnitMenuDelegate;

@end
