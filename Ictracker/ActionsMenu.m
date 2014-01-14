//
//  ActionsMenu.m
//  Ictracker
//
//  Created by S. Cook on 1/13/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "ActionsMenu.h"
#import "Utils.h"

@implementation ActionsMenu

- (id)init
{
    CGRect frame = CGRectMake(
                              0.0,
                              0.0,
                              [Utils millimetersToPixels:57],
                              [Utils windowWidth]-[Utils millimetersToPixels:5]);
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
        
    }
    return self;
}

- (void) click:(id)selector
{
    
}

@end
