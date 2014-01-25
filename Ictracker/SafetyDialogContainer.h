//
//  SafetyDialogContainer.h
//  Ictracker
//
//  Created by S. Cook on 1/24/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonClickDelegate.h"
#import "ButtonView.h"
#import "SafetyButtonDelegate.h"
#import "SafetyDialog.h"

@interface SafetyDialogContainer : UIView<ButtonClickDelegate>

@property (readonly, retain, nonatomic) ButtonView* windowCancelButton;
@property (readonly, retain, nonatomic) id<SafetyButtonDelegate> delegate;
@property (readonly, retain, nonatomic)  SafetyDialog* safetyDialog;

- (id)initWithDelegate:(id<SafetyButtonDelegate>)delegate safetyNames:(NSArray*)safetyNames;

@end
