//
//  CityUnitsView.m
//  Ictracker
//
//  Created by S. Cook on 1/13/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "CityUnitsView.h"
#import "Utils.h"
#import "ButtonView.h"

@implementation CityUnitsView

- (id)initWithEngNames:(NSArray*)engNames ladNames:(NSArray*)ladNames bcNames:(NSArray*)bcNames
{
    CGRect frame = CGRectMake(
                              [Utils millimetersToPixels:9.5],
                              [Utils millimetersToPixels:7],
                              [Utils millimetersToPixels:47],
                              [Utils windowWidth]-[Utils millimetersToPixels:10]);
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        
        double orig_x = 1.0;//mm
        double orig_y = 1.0;//mm
        double x = orig_x;
        double y = orig_y;
        int many_cols = 5;
        int col = 1;
        for (NSString *engName in engNames) {
            ButtonView* btn = [[ButtonView alloc] initWithName:engName delegate:self size:BUTTON_MEDIUM];
            [self addSubview:btn];
            [btn setPosition:CGPointMake(
                                         [Utils millimetersToPixels:x],
                                         [Utils millimetersToPixels:y])];
            if(col%many_cols==0) {
                col=1;
                x = orig_x;
                y += 7;
            } else {
                col++;
                x += 9;
            }
        }
    }
    return self;
}

- (void) click:(id)selector
{
    NSLog(@"click unit button");
}

@end
