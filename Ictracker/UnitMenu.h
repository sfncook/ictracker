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
#import "ButtonClickDelegate.h"

@interface UnitMenu : UIView<ButtonClickDelegate>

@property (nonatomic, retain) ButtonView* mesaCityButton;
@property (nonatomic, retain) ButtonView* ajCityButton;
@property (nonatomic, retain) MesaUnitsView* mesaUnitsView;
@property (nonatomic, retain) AjUnitsView* ajUnitsView;

@end
