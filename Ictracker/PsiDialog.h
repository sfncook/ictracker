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

@interface PsiDialog : UIView<ButtonClickDelegate, UIPickerViewDelegate>

@property (readonly, retain, nonatomic) ButtonView* windowCancelButton;
@property (readonly, retain, nonatomic) id<PsiDialogDelegate> delegate;
@property (readonly, retain, nonatomic) NSArray* psiValues;
@property (readonly, retain, nonatomic) UIPickerView* picker;

- (id)initWithDelegate:(id<PsiDialogDelegate>)delegate;
- (void) setSelectedPsi:(NSString*)psi;
- (void) setPosition:(CGPoint)position;

@end
