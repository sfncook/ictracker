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
    NSArray *actionNames = @[
                             @"Search & Rescue",
                             @"Fire Control",
                             @"Secure Utilities",
                             @"Vertical Ventilation",
                             @"Horizontal Ventilation",
                             @"Open the Building",
                             @"Soften the Building",
                             @"360 of the Building",
                             @"Recon",
                             @"Supply Line",
                             @"Take a Line",
                             @"1-1/2\"",
                             @"1-3/4\"",
                             @"2\"",
                             @"2-1/2\"",
                             @"3\"",
                             @"Portable Master Stream",
                             @"Elevated Master Stream",
                             @"Deck Gun",
                             @"Charge the Sprinkler System",
                             @"Charge the Stand Pipe",
                             @"Fan to the Door"];
    
    self = [super initWithItems:actionNames];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

- (void) click:(id)selector
{
    NSLog(@"click action button");
}

@end
