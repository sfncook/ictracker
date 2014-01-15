//
//  OsrMenu.m
//  Ictracker
//
//  Created by S. Cook on 1/13/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "OsrMenu.h"
#import "Utils.h"

@implementation OsrMenu

- (id)init
{
    NSArray *itemNames = @[
                           @"Unit ID",
                           @"Address",
                           @"Occupancy",
                           @"Construction",
                           @"Conditions",
                           @"Assume Command",
                           @"Location(mobile/cab)",
                           @"Strategy (off./def.)",
                           @"Attack line",
                           @"Water supply",
                           @"IRIC",
                           @"Accountability"];
    
    self = [super initWithItems:itemNames];
    if (self) {
//        self.backgroundColor = [UIColor greenColor];
    }
    return self;
}

@end
