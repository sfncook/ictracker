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
    NSArray *actionNames = @[@"E201",
                             @"E202",
                             @"E203",
                             @"E204",
                             @"E205",
                             @"E206"];
    
    self = [super initWithItems:actionNames];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

@end
