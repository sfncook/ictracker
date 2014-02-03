//
//  VerifyDialog.h
//  Ictracker
//
//  Created by S. Cook on 2/2/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonView.h"
#import "VerifyDialogDelegate.h"
#import "ButtonClickDelegate.h"

@interface VerifyDialog : UIView<ButtonClickDelegate>

@property (readonly, retain, nonatomic) ButtonView* affimativeButton;
@property (readonly, retain, nonatomic) ButtonView* negativeButton;
@property (readonly, retain, nonatomic) ButtonView* windowCancelButton;
@property (readonly, retain, nonatomic) id<VerifyDialogDelegate> delegate;

- (id)initWithDelegate:(id<VerifyDialogDelegate>)delegate msg:(NSString*)msg;

@end
