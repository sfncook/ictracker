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

@synthesize unitsButton;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        
        self.unitsButton = [[ButtonView alloc] initWithName:@"Units" delegate:self size:BUTTON_LARGE];
        [self.unitsButton setPosition:CGPointMake([Utils millimetersToPixels:0.5], [Utils millimetersToPixels:0.5])];
        [self addSubview:self.unitsButton];
    }
    return self;
}

- (void) click:(id)selector
{
    NSLog(@"click.");
}

@end
