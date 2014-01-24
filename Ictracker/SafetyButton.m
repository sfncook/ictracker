//
//  SafetyButton.m
//  Ictracker
//
//  Created by S. Cook on 1/23/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "SafetyButton.h"

@implementation SafetyButton

- (id)init
{
    NSArray* safetyNames = [NSArray arrayWithObjects:
                            @"Jeff Cross",
                            @"Phil Collins",
                            @"Peter Frampton",
                            @"Hewey Lewis",
                            nil];
    
    self = [super initWithName:@"(Select Safety)" delegate:self size:BUTTON_WIDE_LG];
    if (self) {
    }
    return self;
}

- (void) click:(id)selector {

}

@end
