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

- (id)init
{
    CGRect frame = CGRectMake(0, 0, [Utils windowWidth], [Utils windowHeight]);
    self = [super initWithFrame:frame];
    if (self) {
        _windowCancelButton = [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_BLANK_WINDOW];
        [_windowCancelButton setPosition:CGPointMake(0.0,0.0)];
        [self addSubview:_windowCancelButton];
    }
    return self;
}

- (void) click:(id)selector {
    if (selector==_windowCancelButton){
        NSLog(@"window cancel button");
    }
}

@end
