//
//  UnitMenu.h
//  Ictracker
//
//  Created by S. Cook on 1/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonView.h"
#import "CityUnitsView.h"
#import "MesaUnitsView.h"
#import "AjUnitsView.h"
#import "GilbertUnitsView.h"
#import "QueenCreekUnitsView.h"
#import "TempeUnitsView.h"
#import "ChandlerUnitsView.h"
#import "ButtonClickDelegate.h"

@interface UnitMenu : UIView<ButtonClickDelegate>

@property (readonly, nonatomic) ButtonView* allCitiesButton;
@property (readonly, nonatomic) ButtonView* mesaCityButton;
@property (readonly, nonatomic) ButtonView* ajCityButton;
@property (readonly, nonatomic) ButtonView* gilbertCityButton;
@property (readonly, nonatomic) ButtonView* queenCreekButton;
@property (readonly, nonatomic) ButtonView* tempeButton;
@property (readonly, nonatomic) ButtonView* chandlerButton;

@property (readonly, nonatomic) CityUnitsView* allCitiesUnitsView;
@property (readonly, nonatomic) MesaUnitsView* mesaUnitsView;
@property (readonly, nonatomic) AjUnitsView* ajUnitsView;
@property (readonly, nonatomic) GilbertUnitsView* gilbertUnitsView;
@property (readonly, nonatomic) QueenCreekUnitsView* queenCreekUnitsView;
@property (readonly, nonatomic) TempeUnitsView* tempeUnitsView;
@property (readonly, nonatomic) ChandlerUnitsView* chandlerUnitsView;

- (id)initWithFrame:(CGRect)frame cityUnitMenuDelegate:(id<CityUnitMenuDelegate>)cityUnitMenuDelegate;
- (void) setMyFrame:(CGRect)frame;
@end
