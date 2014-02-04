//
//  FireView.h
//  Ictracker
//
//  Created by S. Cook on 1/26/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuSelectorView.h"
#import "MenuContainerView.h"
#import "SectorTBarDelegate.h"
#import "SectorTbarContainerView.h"
#import "TimerView.h"
#import "ModeButton.h"
#import "ModeButtonDelegate.h"
#import "ModeDialogContainer.h"
#import "SafetyButton.h"
#import "SafetyButtonDelegate.h"
#import "SafetyDialogContainer.h"
#import "ReportFormatter.h"
#import "ButtonClickDelegate.h"
#import "ImgButton.h"
#import "PdfView.h"
#import "ShowMailDialogDelegate.h"
#import "SplashDelegate.h"
#import "IncidentEntryDelegate.h"
#import "IncidentEntryView.h"
#import "ButtonView.h"
#import "VerifyDialog.h"
#import "VerifyDialogDelegate.h"

@interface FireView : UIView<SectorTBarDelegate, ModeButtonDelegate, SafetyButtonDelegate, ButtonClickDelegate, IncidentEntryDelegate, VerifyDialogDelegate>

@property (readonly, retain, nonatomic) MenuSelectorView* menuSelectorView;
@property (readonly, retain, nonatomic) MenuContainerView* menuContainerView;
@property (readonly, retain, nonatomic) SectorTbarContainerView* sectorTbarContainerView;

@property (readonly, retain, nonatomic) TimerView* timerView;

@property (readonly, retain, nonatomic) ModeButton* modeButton;
@property (readonly, retain, nonatomic)  ModeDialogContainer* modeDialogContainer;

@property (readonly, retain, nonatomic) SafetyButton* safetyButton;
@property (readonly, retain, nonatomic) SafetyDialogContainer* safetyDialogContainer;

@property (readonly, retain, nonatomic) ImgButton* logoButton;
@property (readonly, retain, nonatomic) ImgButton* pdfButton;
@property (readonly, retain, nonatomic) ReportFormatter* reportFormatter;

@property (readonly, retain, nonatomic) PdfView* pdfView;

@property (readonly, retain, nonatomic) id<SplashDelegate> splashDelegate;

@property (readonly, copy, nonatomic) NSString* address;
@property (readonly, copy, nonatomic) NSString* incidentId;
@property (readonly, retain, nonatomic) IncidentEntryView* incidentEntryView;

@property (readonly, copy, nonatomic) UILabel* incidentInfoLabel;

@property (readonly, retain, nonatomic) ButtonView* completeButton;
@property (readonly, retain, nonatomic) VerifyDialog* verifyDialog;
@property (assign, nonatomic)           BOOL isComplete;

- (id)initWithMailDelegate:(id<ShowMailDialogDelegate>) delegate splashDelegate:(id<SplashDelegate>)splashDelegate;

@end
