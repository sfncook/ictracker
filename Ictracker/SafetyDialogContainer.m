//
//  SafetyDialogContainer.m
//  Ictracker
//
//  Created by S. Cook on 1/24/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "SafetyDialogContainer.h"
#import "Utils.h"

@implementation SafetyDialogContainer

- (id)initWithDelegate:(id<SafetyButtonDelegate>)delegate safetyNames:(NSArray*)safetyNames
{
    CGRect frame = CGRectMake(0, 0, [Utils windowHeight], [Utils windowWidth]);
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _delegate = delegate;
        _windowCancelButton = [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_BLANK_WINDOW];
        [_windowCancelButton setPosition:CGPointMake(0.0,0.0)];
        
        _safetyDialog = [[SafetyDialog alloc] initWithDelegate:delegate safetyNames:safetyNames];
        [_safetyDialog setPosition:CGPointMake(
                                             [Utils millimetersToPixels:74],
                                             [Utils millimetersToPixels:4.5])];
        
        [self addSubview:_windowCancelButton];
        [self addSubview:_safetyDialog];
    }
    return self;
}

- (void) click:(id)selector {
    if (selector==_windowCancelButton){
        [_delegate cancelSafetyDialog];
    }
}

@end
