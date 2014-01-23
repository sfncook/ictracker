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
@property (assign, atomic)  Mode mode;

- (id)initWithDelegate:(id<ModeButtonDelegate>)delegate;
+ (NSString*) modeToString:(Mode)mode;

@end
