//
//  ModeDialog.h
//  Ictracker
//
//  Created by S. Cook on 1/22/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModeButton.h"
#import "ModeButtonDelegate.h"

@interface ModeDialog : UIView<ModeButtonDelegate>
@property (assign, atomic)              Mode curMode;
@property (readonly, retain, nonatomic) ModeButton* offensiveButton;
@property (readonly, retain, nonatomic) ModeButton* defensiveButton;
@property (readonly, retain, nonatomic) ModeButton* marginalButton;
@property (readonly, retain, nonatomic) id<ModeButtonDelegate> delegate;

- (id)initWithDelegate:(id<ModeButtonDelegate>)delegate;
- (void) setPosition:(CGPoint)position;
- (void) setMode:(Mode)mode;

@end
