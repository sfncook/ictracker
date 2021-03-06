//
//  ModeButton.h
//  Ictracker
//
//  Created by S. Cook on 1/22/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "ButtonView.h"
#import "ButtonClickDelegate.h"
#import "ModeButtonDelegate.h"

@interface ModeButton : ButtonView<ButtonClickDelegate>

@property (readonly, nonatomic)     id<ModeButtonDelegate> delegate;
@property (assign, atomic)  Mode myMode;

- (id)initWithDelegate:(id<ModeButtonDelegate>)delegate;
- (id)initWithDelegate:(id<ModeButtonDelegate>)delegate size:(ButtonSize)size;
+ (NSString*) modeToString:(Mode)mode;
- (void) setMode:(Mode)mode;
- (void) setIsHighlighted:(BOOL)isHighlighted;

@end
