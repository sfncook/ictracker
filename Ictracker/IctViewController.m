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
    
    [_menuContainerView setMenuSelectorDelegate:_menuSelectorView];
    [_menuContainerView showUnits];//Must do this after setMenuSelectorDelegate: for proper functionality
    
    _timerView = [[TimerView alloc] init];
    
    _modeButton = [[ModeButton alloc] initWithDelegate:self];
    [_modeButton setPosition:CGPointMake(
                                         [Utils millimetersToPixels:120],
                                         [Utils millimetersToPixels:6.5])];
    _modeDialog = [[ModeDialog alloc] initWithDelegate:self];
    [_modeDialog setPosition:CGPointMake(
                                         [Utils millimetersToPixels:119],
                                         [Utils millimetersToPixels:6])];
    _modeDialog.hidden = YES;
    
    _modeDialogContainer = [[ModeDialogContainer alloc] init];
    _modeDialogContainer.hidden = YES;
    
    [self.view addSubview:self.menuSelectorView];
    [self.view addSubview:_sectorTbarContainerView];
    [self.view addSubview:_menuContainerView];
    [self.view addSubview:_timerView];
    [self.view addSubview:_modeDialog];
    [self.view addSubview:_modeButton];
    [self.view addSubview:_modeDialogContainer];
    
}

//*** SectorTBarDelegate ***
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


//*** ModeButtonDelegate ***
- (void) clickModeButton:(Mode)currentMode {
    _modeDialog.hidden = !_modeDialog.hidden;
    [_modeDialog setMode:currentMode];
}
- (void) cancelModeDialog {
    _modeDialog.hidden = YES;
}
- (void) selectNewMode:(Mode)newMode {
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
