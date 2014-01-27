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
                                         [Utils millimetersToPixels:5])];
    
    _modeDialogContainer = [[ModeDialogContainer alloc] initWithDelegate:self];
    _modeDialogContainer.hidden = YES;
    
    _safetyButton = [[SafetyButton alloc] initWithDelegate:self initialSafety:@"Jeff Cross"];
    [_safetyButton setPosition:CGPointMake(
                                         [Utils millimetersToPixels:75],
                                         [Utils millimetersToPixels:5])];
    
    NSArray* safetyNames = [NSArray arrayWithObjects:
                            @"Jeff Cross",
                            @"Phil Collins",
                            @"Peter Frampton",
                            @"Hewey Lewis",
                            nil];
    _safetyDialogContainer = [[SafetyDialogContainer alloc] initWithDelegate:self safetyNames:safetyNames];
    _safetyDialogContainer.hidden = YES;
    
    UILabel* safetyLabel = [[UILabel alloc] initWithFrame:
                            CGRectMake(
                                       [Utils millimetersToPixels:63.5],
                                       [Utils millimetersToPixels:5.5],
                                       [Utils millimetersToPixels:11],
                                       [Utils millimetersToPixels:5])];
    [safetyLabel setText:@"Safety:"];
    
    _exportButton = [[ButtonView alloc] initWithName:@"Export PDF" delegate:self size:BUTTON_WIDE_LG];
    [_exportButton setPosition:CGPointMake(
                                           [Utils millimetersToPixels:15],
                                           [Utils millimetersToPixels:5])];
    _reportFormatter = [[ReportFormatter alloc]init];
    
    UIImageView* logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ictlogo"]];
    [logo setFrame:CGRectMake(
                              [Utils millimetersToPixels:1],
                              [Utils millimetersToPixels:3.5],
                              [Utils millimetersToPixels:9],
                              [Utils millimetersToPixels:9])];
    
    _splashView = [[SplashView alloc] init];
    
    
    [self.view addSubview:safetyLabel];
    [self.view addSubview:self.menuSelectorView];
    [self.view addSubview:_sectorTbarContainerView];
    [self.view addSubview:_menuContainerView];
    [self.view addSubview:_exportButton];
    [self.view addSubview:_timerView];
    [self.view addSubview:_modeDialogContainer];
    [self.view addSubview:_modeButton];
    [self.view addSubview:_safetyDialogContainer];
    [self.view addSubview:_safetyButton];
    [self.view addSubview:logo];
    [self.view addSubview:_splashView];
    
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
    [self.view bringSubviewToFront:_modeDialogContainer];
    [self.view bringSubviewToFront:_modeButton];
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
    [self.view bringSubviewToFront:_safetyDialogContainer];
    [self.view bringSubviewToFront:_safetyButton];
}
- (void) cancelSafetyDialog{
    _safetyDialogContainer.hidden = YES;
}
- (void) selectNewSafety:(NSString*)newSafety{
    _safetyDialogContainer.hidden = YES;
    [_safetyButton setSafety:newSafety];
}


//*** ButtonClickDelegate ***
- (void) click:(id)selector {
    if (_exportButton==selector) {
        [_reportFormatter generatePdfWithTxLogger:[TransactionLogger transLogger]
                                          address:@"3026 Market St San Francisco, CA 94114"
                                       incidentId:@"431567"
                                            title:@"City of Mesa Fire Department\nFire Incident Command Tracker - Report Log"];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
