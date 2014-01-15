//
//  UnitMenu.h
//  Ictracker
//
//  Created by S. Cook on 1/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonView.h"
#import "MesaUnitsView.h"
#import "AjUnitsView.h"
#import "GilbertUnitsView.h"
#import "ButtonClickDelegate.h"

@interface UnitMenu : UIView<ButtonClickDelegate>

@property (readonly, nonatomic) ButtonView* mesaCityButton;
@property (readonly, nonatomic) ButtonView* ajCityButton;
@property (readonly, nonatomic) ButtonView* gilbertCityButton;

@property (readonly, nonatomic) ButtonView* engUnitTypeButton;
@property (readonly, nonatomic) ButtonView* ladUnitTypeButton;
@property (readonly, nonatomic) ButtonView* bcUnitTypeButton;

@property (readonly, nonatomic) MesaUnitsView* mesaUnitsView;
@property (readonly, nonatomic) AjUnitsView* ajUnitsView;
@property (readonly, nonatomic) GilbertUnitsView* gilbertUnitsView;

- (id)initWithCityUnitMenuDelegate:(id<CityUnitMenuDelegate>)cityUnitMenuDelegate;

@end
