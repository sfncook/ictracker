//
//  SectorMenu.m
//  Ictracker
//
//  Created by S. Cook on 1/13/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "SectorMenu.h"
#import "Utils.h"

@implementation SectorMenu

- (id)init
{
    NSArray *sectorNames = @[@"E201",
                          @"E202",
                          @"E203",
                          @"E204",
                          @"E205",
                          @"E206"];
    
    self = [super initWithItems:sectorNames];
    if (self) {
        self.backgroundColor = [UIColor purpleColor];
    }
    return self;
}

@end
