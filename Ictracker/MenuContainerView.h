//
//  MenuContainerView.h
//  Ictracker
//
//  Created by S. Cook on 1/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UnitMenu.h"
#import "SectorMenu.h"
#import "MenuSelectorDelegate.h"
#import "ActionsMenu.h"
#import "BenchmarksMenu.h"
#import "ObjectivesMenu.h"
#import "OsrMenu.h"
#import "NotesMenu.h"
#import "CityUnitMenuDelegate.h"

@interface MenuContainerView : UIView<MenuSelectorDelegate>

@property (readonly, nonatomic) UnitMenu* unitMenu;
@property (readonly, nonatomic) SectorMenu* sectorMenu;
@property (readonly, nonatomic) ActionsMenu* actionsMenu;
@property (readonly, nonatomic) BenchmarksMenu* benchmarksMenu;
@property (readonly, nonatomic) ObjectivesMenu* objectivesMenu;
@property (readonly, nonatomic) OsrMenu* osrMenu;
@property (readonly, nonatomic) NotesMenu* notesMenu;

- (id)initWithSectorMenuDelegate:(id<SectorMenuDelegate>)sectorMenuDelegate
            cityUnitMenuDelegate:(id<CityUnitMenuDelegate>)cityUnitMenuDelegate;

@end
