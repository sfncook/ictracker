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
    
    _sectorTbarContainerView = [[SectorTbarContainerView alloc] initWithDelegate:self];
    
    _menuContainerView = [[MenuContainerView alloc] initWithSectorMenuDelegate:_sectorTbarContainerView
                                                          cityUnitMenuDelegate:_sectorTbarContainerView
                                                            actionMenuDelegate:_sectorTbarContainerView];
    
	_menuSelectorView = [[MenuSelectorView alloc] initWithDelegate:_menuContainerView];
    
    
    [_menuContainerView showUnits];//Must do this after setting delegates for proper functionality
    [self.view addSubview:self.menuSelectorView];
    [self.view addSubview:_sectorTbarContainerView];
    [self.view addSubview:_menuContainerView];
    
}

//*** SectorTBarDelegate
- (void) onSelected:(id)selected
{
    //Do nothing
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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
