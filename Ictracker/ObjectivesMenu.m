//
//  ObjectivesMenu.m
//  Ictracker
//
//  Created by S. Cook on 1/13/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "ObjectivesMenu.h"
#import "Utils.h"

@implementation ObjectivesMenu

- (id)init
{
    NSArray *itemNames = @[
                                @"All Clear",
                                @"Under Control",
                                @"Loss Stopped",
                                @"Upgrade to full rescue",
                                @"Assing safety",
                                @"Establish supply line",
                                @"Secure utilities",
                                @"Ventilation",
                                @"Create \"On deck\"",
                                @"Pressurize exposures",
                                @"Monitor channel 16",
                                @"Salvage",
                                @"Establish rehab",
                                @"Occupant services"];
    
    self = [super initWithItems:itemNames];
    if (self) {
        self.backgroundColor = [UIColor brownColor];
    }
    return self;
}

@end
