//
//  GilbertUnitsView.m
//  Ictracker
//
//  Created by S. Cook on 1/13/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "GilbertUnitsView.h"
#import "Utils.h"

@implementation GilbertUnitsView

- (id)init
{
    NSArray *engNames = @[@"E281",
                          @"E282",
                          @"E283",
                          @"E284",
                          @"E285",
                          @"E286",
                          @"E287",
                          @"E288",
                          @"E289",
                          @"E290"];
    
    NSArray *ladNames = @[@"L291",
                          @"L292",
                          @"L293",
                          @"L294"];
    
    NSArray *bcNames = @[@"B291"];
    
    self = [super initWithEngNames:engNames ladNames:ladNames bcNames:bcNames];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

@end
