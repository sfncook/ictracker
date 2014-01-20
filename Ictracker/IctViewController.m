//
//  IctViewController.m
//  Ictracker
//
//  Created by S. Cook on 1/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "IctViewController.h"
#import "Utils.h"
#import "SectorTBarView.h"

@interface IctViewController ()

@end

@implementation IctViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _menuContainerView = [[MenuContainerView alloc] initWithSectorMenuDelegate:self
                                                          cityUnitMenuDelegate:self
                                                            actionMenuDelegate:self];
    [self.view addSubview:_menuContainerView];
    
	_menuSelectorView = [[MenuSelectorView alloc] initWithFrame:
                         CGRectMake(0,
                                    [Utils millimetersToPixels:13],
                                    [Utils millimetersToPixels:13],
                                    [Utils windowWidth]-[Utils millimetersToPixels:5])
                                                       delegate:_menuContainerView];
    [self.view addSubview:self.menuSelectorView];
    
    [_menuContainerView setShowMenuDelegate:_menuSelectorView];
    [_menuContainerView showUnits];
    
    
    _sectorTbarContainerView = [[SectorTbarContainerView alloc] initWithDelegate:self];
    [self.view addSubview:_sectorTbarContainerView];
    
}

//*** SectorTBarDelegate
- (void) onSelected:(id)selected
{
//    for(SectorTBarView* sector in _sectorTBars) {
//        if(sector!=selected) {
//            [sector setIsSelected:NO];
//        }
//    }
}
- (void) onTitleClick:(id)selected
{
    [_menuContainerView showSectors];
}
- (void) onActionClick:(id)selected
{
    [_menuContainerView showActions];
}
- (void) onUnitClick:(id)selected
{
    [_menuContainerView showUnits];
}
- (void) onActionableUnitClick:(id)selected
{
    [_menuContainerView showUnits];
}

//*** SectorMEnuDelegate
- (void) onClickSector:(NSString*)sectorTitle
{
//    for(SectorTBarView* sector in _sectorTBars) {
//        if([sector isSelected]) {
//            [sector setTitle:sectorTitle];
//        }
//    }
}

//*** CityUnitMenuDelegate
- (void) onSelectedUnit:(NSString*)unitName
{
//    for(SectorTBarView* sector in _sectorTBars) {
//        if([sector isSelected]) {
//            [sector addUnit:unitName];
//        }
//    }
}

//*** ActionMenuDelegate
- (void) onClickAction:(NSString*)actionTitle
{
//    for(SectorTBarView* sector in _sectorTBars) {
//        if([sector isSelected]) {
//            [sector addAction:actionTitle];
//        }
//    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
