//
//  SafetyButton.m
//  Ictracker
//
//  Created by S. Cook on 1/23/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "SafetyButton.h"

@implementation SafetyButton

- (id)initWithDelegate:(id<SafetyButtonDelegate>)delegate initialSafety:(NSString*)initialSafety
{
    self = [super initWithName:initialSafety delegate:self size:BUTTON_WIDE_LG];
    if (self) {
        _delegate = delegate;
    }
    return self;
}

- (void) setSafety:(NSString *)safety {
    _mySafety = safety;
    [self setName:_mySafety];
}


- (void) click:(id)selector {
    [_delegate clickSafetyButton:_mySafety];
}

@end
