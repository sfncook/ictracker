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

- (id)initWithMailDelegate:(id<ShowMailDialogDelegate>) delegate splashDelegate:(id<SplashDelegate>)splashDelegate
{
    self = [super initWithFrame:CGRectMake(0, 0, [Utils windowHeight], [Utils windowWidth])];
    if (self) {
        _isComplete = NO;
        _splashDelegate = splashDelegate;
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
                                             [Utils millimetersToPixels:135],
                                             [Utils millimetersToPixels:5])];
        
        _modeDialogContainer = [[ModeDialogContainer alloc] initWithDelegate:self];
        _modeDialogContainer.hidden = YES;
        
        _safetyButton = [[SafetyButton alloc] initWithDelegate:self initialSafety:@"Jeff Cross"];
        [_safetyButton setPosition:CGPointMake(
                                               [Utils millimetersToPixels:100],
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
                                           [Utils millimetersToPixels:88.5],
                                           [Utils millimetersToPixels:5.5],
                                           [Utils millimetersToPixels:11],
                                           [Utils millimetersToPixels:5])];
        [safetyLabel setText:@"Safety:"];
        
        _pdfButton = [[ImgButton alloc] initWithImage:@"pdf" delegate:self size:IMG_BUTTON_MEDIUM];
        [_pdfButton setPosition:CGPointMake(
                                           [Utils millimetersToPixels:15],
                                           [Utils millimetersToPixels:3.5])];
        
        _reportFormatter = [[ReportFormatter alloc]init];
        
        _logoButton = [[ImgButton alloc] initWithImage:@"ictlogo" delegate:self size:IMG_BUTTON_MEDIUM];
        [_logoButton setFrame:CGRectMake(
                                  [Utils millimetersToPixels:1],
                                  [Utils millimetersToPixels:3.5],
                                  [Utils millimetersToPixels:9],
                                  [Utils millimetersToPixels:9])];
        
        _pdfView = [[PdfView alloc] initWithDelegate:delegate];
        _pdfView.hidden = YES;
        
        _address = @"";
        _incidentId = @"";
        
        _incidentEntryView = [[IncidentEntryView alloc] initWithDelegate:self];
        
        _incidentInfoLabel = [[UILabel alloc] init];
        _incidentInfoLabel.frame = CGRectMake(
                                         [Utils millimetersToPixels:13]+1,
                                         [Utils windowWidth]-[Utils millimetersToPixels:5],
                                         [Utils windowHeight]-[Utils millimetersToPixels:13]-1,
                                         [Utils millimetersToPixels:5]);
        _incidentInfoLabel.backgroundColor = [UIColor whiteColor];
        
        _completeButton = [[ButtonView alloc] initWithName:@"Complete" delegate:self size:BUTTON_HEADER];
        [_completeButton setPosition:CGPointMake(
                                            [Utils millimetersToPixels:30],
                                            [Utils millimetersToPixels:4.5])];
        
        _verifyDialog = [[VerifyDialog alloc] initWithDelegate:self msg:@"Are you certain you want to complete this incident?"];
        _verifyDialog.hidden = YES;
        
        [self addSubview:_verifyDialog];
        [self addSubview:safetyLabel];
        [self addSubview:_completeButton];
        [self addSubview:self.menuSelectorView];
        [self addSubview:_sectorTbarContainerView];
        [self addSubview:_menuContainerView];
        [self addSubview:_pdfButton];
        [self addSubview:_timerView];
        [self addSubview:_modeDialogContainer];
        [self addSubview:_modeButton];
        [self addSubview:_safetyDialogContainer];
        [self addSubview:_safetyButton];
        [self addSubview:_logoButton];
        [self addSubview:_incidentInfoLabel];
        [self addSubview:_pdfView];
        [self addSubview:_incidentEntryView];
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

- (void) openReport {
    NSString* address = _address;
    NSString* incidentId = _incidentId;
    NSString* title = @"City of Mesa Fire Department\nFire Incident Command Tracker - Report Log";
    NSString* pdfFile = [_reportFormatter generatePdfWithTxLogger:[TransactionLogger transLogger]
                                                          address:address
                                                       incidentId:incidentId
                                                            title:title];
    
    [_pdfView openWithPdfFile:pdfFile address:address incidentId:incidentId];
    [self bringSubviewToFront:_pdfView];
}

//*** ButtonClickDelegate ***
- (void) click:(id)selector {
    if (_pdfButton==selector) {
        [self openReport];
    }
    if (_logoButton==selector) {
        [_splashDelegate showSplash];
    }
    if (_completeButton==selector) {
        _verifyDialog.hidden=NO;
        [self bringSubviewToFront:_verifyDialog];
    }
}

-(void) updateIncidentInfoLabel {
    [_incidentInfoLabel setText:[NSString stringWithFormat:@"  Incident#:%@    Address:%@", _incidentId, _address]];
}

//*** IncidentEntryDelegate ***
-(void) setAddress:(NSString*)address {
    _address = address;
    [self updateIncidentInfoLabel];
}
-(void) setIncidentId:(NSString*)incidentId {
    _incidentId = incidentId;
    [self updateIncidentInfoLabel];
}


//*** VerifyDialogDelegate ***
- (void) pickAffirmative {
    _isComplete = YES;
    Transaction* tx = [Transaction transactionWithType:TRANSTYPE_COMPLETE date:[NSDate date] param:nil];
    [[TransactionLogger transLogger] addTransaction:tx];
    [self openReport];
}
- (void) pickNegative {
    //do nothing
}
- (void) pickCancel {
    //do nothing
}

@end
