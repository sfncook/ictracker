//
//  IctViewController.h
//  Ictracker
//
//  Created by S. Cook on 1/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuSelectorView.h"
#import "MenuContainerView.h"
#import "SectorTBarDelegate.h"
#import "SectorMenuDelegate.h"
#import "CityUnitMenuDelegate.h"
#import "ActionMenuDelegate.h"
#import "SectorTbarContainerView.h"

@interface IctViewController : UIViewController<SectorTBarDelegate, SectorMenuDelegate, CityUnitMenuDelegate, ActionMenuDelegate>

@property (readonly, nonatomic) MenuSelectorView* menuSelectorView;
@property (readonly, nonatomic) MenuContainerView* menuContainerView;
@property (readonly, nonatomic) SectorTbarContainerView* sectorTbarContainerView;

@end
