//
//  AjUnitsView.m
//  Ictracker
//
//  Created by S. Cook on 1/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "AjUnitsView.h"
#import "Utils.h"

@implementation AjUnitsView

- (id)init
{
    NSArray *engNames = @[@"E261",
                          @"E262",
                          @"E265"];
    
    NSArray *ladNames = @[@"L263",
                          @"L264"];
    
    NSArray *bcNames = @[@"B261"];
    
    self = [super initWithEngNames:engNames ladNames:ladNames bcNames:bcNames];
    if (self) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}



@end
