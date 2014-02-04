//
//  PsiDialog.h
//  Ictracker
//
//  Created by S. Cook on 2/3/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonView.h"
#import "ButtonClickDelegate.h"
#import "PsiDialogDelegate.h"

@interface PsiDialog : UIView<ButtonClickDelegate>

@property (readonly, retain, nonatomic) ButtonView* windowCancelButton;
@property (readonly, retain, nonatomic) id<PsiDialogDelegate> delegate;

- (id)initWithDelegate:(id<PsiDialogDelegate>)delegate;
- (void) setSelectedPsi:(NSString*)psi;

@end
