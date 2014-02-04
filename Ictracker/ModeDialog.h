//
//  ModeDialog.h
//  Ictracker
//
//  Created by S. Cook on 1/22/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonView.h"
#import "ButtonClickDelegate.h"
#import "ModeButtonDelegate.h"

@interface ModeDialog : UIView<ButtonClickDelegate>
@property (assign, atomic)              Mode curMode;
@property (readonly, retain, nonatomic) ButtonView* offensiveButton;
@property (readonly, retain, nonatomic) ButtonView* defensiveButton;
@property (readonly, retain, nonatomic) ButtonView* marginalButton;
@property (readonly, retain, nonatomic) id<ModeButtonDelegate> delegate;

- (id)initWithDelegate:(id<ModeButtonDelegate>)delegate;
- (void) setPosition:(CGPoint)position;
- (void) setMode:(Mode)mode;

@end
