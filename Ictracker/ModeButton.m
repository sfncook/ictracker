//
//  ModeButton.m
//  Ictracker
//
//  Created by S. Cook on 1/22/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "ModeButton.h"

@implementation ModeButton

const Mode DEFAULT_MODE = MODE_OFFENSIVE;

- (id)init {
    self = [super initWithName:[ModeButton modeToString:DEFAULT_MODE] delegate:self size:BUTTON_WIDE];
    if (self) {
        _mode = MODE_OFFENSIVE;
    }
    return self;
}

+ (NSString*) modeToString:(Mode)mode {
    switch (mode) {
        case MODE_OFFENSIVE:
            return @"Offensive";
            break;
        case MODE_DEFENSIVE:
            return @"Defensive";
            break;
        case MODE_MARGINAL:
            return @"Marginal";
            break;
        default:
            return @"Undefined";
    }
}

- (void) click:(id)selector {
    
}

@end
