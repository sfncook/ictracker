//
//  ModeDialogContainer.h
//  Ictracker
//
//  Created by S. Cook on 1/22/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonView.h"
#import "ButtonClickDelegate.h"
#import "ModeButtonDelegate.h"
#import "ModeDialog.h"

@interface ModeDialogContainer : UIView<ButtonClickDelegate>

@property (readonly, retain, nonatomic) ButtonView* windowCancelButton;
@property (readonly, retain, nonatomic) id<ModeButtonDelegate> delegate;
@property (retain, atomic)  ModeDialog* modeDialog;

- (id)initWithDelegate:(id<ModeButtonDelegate>)delegate;
- (void) setMode:(Mode)mode;

@end
