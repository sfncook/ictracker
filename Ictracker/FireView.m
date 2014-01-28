//
//  FireView.m
//  Ictracker
//
//  Created by S. Cook on 1/26/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "Utils.h"
#import "SectorTBarView.h"
#import "FireView.h"

@implementation FireView

- (id)init
{
    self = [super initWithFrame:CGRectMake(0, 0, [Utils windowHeight], [Utils windowWidth])];
    if (self) {
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
        
        _pdfButton = [[ImgButton alloc] initWithImage:@"pdf" delegate:self size:IMG_BUTTON_MEDIUM];
        [_pdfButton setPosition:CGPointMake(
                                           [Utils millimetersToPixels:15],
                                           [Utils millimetersToPixels:3.5])];
        
        _reportFormatter = [[ReportFormatter alloc]init];
        
        UIImageView* logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ictlogo"]];
        [logo setFrame:CGRectMake(
                                  [Utils millimetersToPixels:1],
                                  [Utils millimetersToPixels:3.5],
                                  [Utils millimetersToPixels:9],
                                  [Utils millimetersToPixels:9])];
        
        _pdfView = [[PdfView alloc] init];
        _pdfView.hidden = YES;
        
        
        
        [self addSubview:safetyLabel];
        [self addSubview:self.menuSelectorView];
        [self addSubview:_sectorTbarContainerView];
        [self addSubview:_menuContainerView];
        [self addSubview:_pdfButton];
        [self addSubview:_timerView];
        [self addSubview:_modeDialogContainer];
        [self addSubview:_modeButton];
        [self addSubview:_safetyDialogContainer];
        [self addSubview:_safetyButton];
        [self addSubview:logo];
        [self addSubview:_pdfView];
    }
    return self;
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
    [self bringSubviewToFront:_modeDialogContainer];
    [self bringSubviewToFront:_modeButton];
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
    [self bringSubviewToFront:_safetyDialogContainer];
    [self bringSubviewToFront:_safetyButton];
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
    if (_pdfButton==selector) {
        NSString* pdfFile = [_reportFormatter generatePdfWithTxLogger:[TransactionLogger transLogger]
                                          address:@"3026 Market St San Francisco, CA 94114"
                                       incidentId:@"431567"
                                            title:@"City of Mesa Fire Department\nFire Incident Command Tracker - Report Log"];
        
        [_pdfView openWithPdfFile:pdfFile];
    }
}

@end
