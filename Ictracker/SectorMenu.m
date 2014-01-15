//
//  SectorMenu.m
//  Ictracker
//
//  Created by S. Cook on 1/13/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "SectorMenu.h"
#import "Utils.h"
#import "ButtonView.h"

@implementation SectorMenu

- (id)initWithDelegate:(id<SectorMenuDelegate>)menuDelegate
{
    NSArray *sectorNames = @[
                             @"Sector 1",
                             @"Sector 2",
                             @"Sector 3",
                             @"Sector 4",
                             @"A Sector",
                             @"B Sector",
                             @"C Sector",
                             @"D Sector",
                             @"North Sector",
                             @"East Sector",
                             @"South Sector",
                             @"West Sector",
                             @"Interior",
                             @"Roof",
                             @"Ventilation",
                             @"Salvage",
                             @"Cust Service",
                             @"Sprinkler",
                             @"Stand-pipe",
                             @"On Deck",
                             @"IRIC",
                             @"RIC",
                             @"Medical",
                             @"Safety",
                             @"Staging",
                             @"Lobby",
                             @"Treatment",
                             @"Evacuation",
                             @"Resource",
                             @"Transportation",
                             @"Accountability",
                             @"Triage"];
    
    self = [super initWithItems:sectorNames];
    if (self) {
//        self.backgroundColor = [UIColor purpleColor];
        _menuDelegate = menuDelegate;
    }
    return self;
}

- (void) click:(id)selector
{
    ButtonView* sectorButton = selector;
    [_menuDelegate onClickSector:[sectorButton name]];
}

@end
