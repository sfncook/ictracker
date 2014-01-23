//
//  ModeButton.h
//  Ictracker
//
//  Created by S. Cook on 1/22/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "ButtonView.h"
#import "ButtonClickDelegate.h"

typedef enum modes {
    MODE_OFFENSIVE,
    MODE_DEFENSIVE,
    MODE_MARGINAL} Mode;

@interface ModeButton : ButtonView<ButtonClickDelegate>

@property (assign, atomic)  Mode mode;

- (id)init;
+ (NSString*) modeToString:(Mode)mode;

@end
