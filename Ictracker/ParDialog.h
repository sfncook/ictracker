//
//  ParDialog.h
//  Ictracker
//
//  Created by S. Cook on 2/4/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonView.h"
#import "ButtonClickDelegate.h"
#import "ParDialogDelegate.h"

@interface ParDialog : UIView<ButtonClickDelegate>

@property (readonly, retain, nonatomic) ButtonView* windowCancelButton;
@property (readonly, retain, nonatomic) id<ParDialogDelegate> delegate;

- (id)initWithDelegate:(id<ParDialogDelegate>)delegate;
- (void) setSelectedPar:(NSString*)par;

@end
