//
//  MenuSelectorView.m
//  Ictracker
//
//  Created by S. Cook on 1/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "MenuSelectorView.h"
#import "Utils.h"

@implementation MenuSelectorView

- (id)initWithFrame:(CGRect)frame delegate:(id<MenuSelectorDelegate>)selectorDelegate_
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        _selectorDelegate = selectorDelegate_;
        
        _unitsButton = [[ButtonView alloc] initWithName:@"Units" delegate:self size:BUTTON_LARGE];
        [_unitsButton setPosition:CGPointMake(
                                            [Utils millimetersToPixels:0.5]-1,
                                            [Utils millimetersToPixels:0.5])];
        [self addSubview:_unitsButton];
        
        _sectorsButton = [[ButtonView alloc] initWithName:@"Sectors" delegate:self size:BUTTON_LARGE];
        [_sectorsButton setPosition:CGPointMake(
                                              [Utils millimetersToPixels:0.5]-1,
                                              _unitsButton.frame.origin.y + _unitsButton.frame.size.height + [Utils millimetersToPixels:1])];
        [self addSubview:_sectorsButton];
        
        
    }
    return self;
}

- (void) click:(id)selector
{
    if(selector==_unitsButton) {
        [_selectorDelegate showUnits];
    } else if(selector==_sectorsButton) {
        [_selectorDelegate showSectors];
    }
}

@end
