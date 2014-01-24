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

- (id)initWithDelegate:(id<ModeButtonDelegate>)delegate {
    self = [super initWithName:[ModeButton modeToString:DEFAULT_MODE] delegate:self size:BUTTON_WIDE_LG];
    if (self) {
        _delegate = delegate;
        [self setMode:DEFAULT_MODE];
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

- (void) setMode:(Mode)mode {
    _myMode = mode;
    [self setName:[ModeButton modeToString:_myMode]];
    switch (_myMode) {
        case MODE_DEFENSIVE:
            [self setNormalColor:[UIColor colorWithRed:1.0 green:0.6 blue:0.6 alpha:1.0]];
            break;
        case MODE_MARGINAL:
            [self setNormalColor:[UIColor colorWithRed:1.0 green:0.9 blue:0.9 alpha:1.0]];
            break;
        case MODE_OFFENSIVE:
            [self setNormalColor:[UIColor colorWithRed:0.7 green:1.0 blue:0.7 alpha:1.0]];
            break;
        default:
            break;
    }
}

- (void) click:(id)selector {
    [_delegate clickModeButton:_myMode];
}

@end
