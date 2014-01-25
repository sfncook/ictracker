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
                                         [Utils millimetersToPixels:6])];
    
    _modeDialogContainer = [[ModeDialogContainer alloc] initWithDelegate:self];
    _modeDialogContainer.hidden = YES;
    
    _safetyButton = [[SafetyButton alloc] initWithDelegate:self initialSafety:@"Jeff Cross"];
    [_safetyButton setPosition:CGPointMake(
                                         [Utils millimetersToPixels:75],
                                         [Utils millimetersToPixels:6])];
    
    NSArray* safetyNames = [NSArray arrayWithObjects:
                            @"Jeff Cross",
                            @"Phil Collins",
                            @"Peter Frampton",
                            @"Hewey Lewis",
                            nil];
    _safetyDialogContainer = [[SafetyDialogContainer alloc] initWithDelegate:self safetyNames:safetyNames];
    _safetyDialogContainer.hidden = YES;
    
    [self.view addSubview:self.menuSelectorView];
    [self.view addSubview:_sectorTbarContainerView];
    [self.view addSubview:_menuContainerView];
    [self.view addSubview:_timerView];
    [self.view addSubview:_modeDialogContainer];
    [self.view addSubview:_modeButton];
    [self.view addSubview:_safetyDialogContainer];
    [self.view addSubview:_safetyButton];
    
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
    _modeDialogContainer.hidden = !_modeDialogContainer.hidden;
}
- (void) cancelModeDialog {
    _modeDialogContainer.hidden = YES;
}
- (void) selectNewMode:(Mode)newMode {
    _modeDialogContainer.hidden = YES;
    [_modeButton setMode:newMode];
}


//*** SafetyButtonDelegate ***
- (void) clickSafetyButton:(NSString*)currentSafety{
    _safetyDialogContainer.hidden = !_safetyDialogContainer.hidden;
}
- (void) cancelSafetyDialog{
    _safetyDialogContainer.hidden = YES;
}
- (void) selectNewSafety:(NSString*)newSafety{
    _safetyDialogContainer.hidden = YES;
    [_safetyButton setSafety:newSafety];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
