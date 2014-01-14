//
//  BenchmarksMenu.m
//  Ictracker
//
//  Created by S. Cook on 1/13/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "BenchmarksMenu.h"
#import "Utils.h"

@implementation BenchmarksMenu

- (id)init
{
    NSArray *benchmarkNames = @[
                             @"Primary Search",
                             @"Secondary Search",
                             @"Fire Control",
                             @"Loss Stop"];
    
    self = [super initWithItems:benchmarkNames];
    if (self) {
        self.backgroundColor = [UIColor brownColor];
    }
    return self;
}

@end
