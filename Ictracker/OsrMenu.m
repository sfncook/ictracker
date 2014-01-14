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
    CGRect frame = CGRectMake(
                              0.0,
                              0.0,
                              [Utils millimetersToPixels:57],
                              [Utils windowWidth]-[Utils millimetersToPixels:5]);
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor cyanColor] ;
        
    }
    return self;
}

- (void) click:(id)selector
{
    
}

@end
