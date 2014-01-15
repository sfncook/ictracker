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

@interface CityUnitsView : UIView<ButtonClickDelegate>

@property (readonly, nonatomic) id<CityUnitMenuDelegate> cityUnitMenuDelegate;

- (id)initWithEngNames:(NSArray*)engNames
              ladNames:(NSArray*)ladNames
               bcNames:(NSArray*)bcNames
              delegate:(id<CityUnitMenuDelegate>)cityUnitMenuDelegate;

@end
