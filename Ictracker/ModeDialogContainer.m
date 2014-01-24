//
//  ModeDialogContainer.m
//  Ictracker
//
//  Created by S. Cook on 1/22/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "ModeDialogContainer.h"
#import "Utils.h"

@implementation ModeDialogContainer

- (id)initWithDelegate:(id<ModeButtonDelegate>)delegate
{
    CGRect frame = CGRectMake(0, 0, [Utils windowHeight], [Utils windowWidth]);
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _delegate = delegate;
        _windowCancelButton = [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_BLANK_WINDOW];
        [_windowCancelButton setPosition:CGPointMake(0.0,0.0)];
        
        _modeDialog = [[ModeDialog alloc] initWithDelegate:delegate];
        [_modeDialog setPosition:CGPointMake(
                                             [Utils millimetersToPixels:119],
                                             [Utils millimetersToPixels:6])];
        
        [self addSubview:_windowCancelButton];
        [self addSubview:_modeDialog];
    }
    return self;
}

- (void) click:(id)selector {
    if (selector==_windowCancelButton){
        NSLog(@"window cancel button");
        [_delegate cancelModeDialog];
    }
}

@end
