//
//  IncidentEntryView.h
//  Ictracker
//
//  Created by S. Cook on 1/28/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IctTextField.h"
#import "IncidentEntryDelegate.h"
#import "ButtonView.h"
#import "ButtonClickDelegate.h"

@interface IncidentEntryView : UIView<UITextFieldDelegate, ButtonClickDelegate>

@property (readonly, retain, nonatomic) id<IncidentEntryDelegate> delegate;
@property (readonly, retain, nonatomic) IctTextField* addressField;
@property (readonly, retain, nonatomic) IctTextField* incidentIdField;
@property (readonly, retain, nonatomic) ButtonView* goButton;

- (id)initWithDelegate:(id<IncidentEntryDelegate>)delegate;

@end
