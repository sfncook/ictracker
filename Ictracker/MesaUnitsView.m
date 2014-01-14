//
//  MesaUnitsView.m
//  Ictracker
//
//  Created by S. Cook on 1/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "MesaUnitsView.h"
#import "Utils.h"

@implementation MesaUnitsView

- (id)init
{
    CGRect frame = CGRectMake(
                              [Utils millimetersToPixels:9.5],
                              [Utils millimetersToPixels:7],
                              [Utils millimetersToPixels:47],
                              [Utils windowWidth]-[Utils millimetersToPixels:10]);
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor purpleColor];
        
        NSArray *engNames = @[@"E201",
                                 @"E202",
                                 @"E203",
                                 @"E204",
                                 @"E205",
                                 @"E206",
                                 @"E207",
                                 @"E208",
                                 @"E209",
                                 @"E210",
                                 @"E211",
                                 @"E212",
                                 @"E213",
                                 @"E215",
                                 @"E216",
                                 @"E217",
                                 @"E218",
                                 @"E219",
                                 @"E220",
                                 @"E221",
                                 @"E222",
                                 @"E223",
                                 @"E224",
                                 @"E225",
                                 @"E226",
                                 @"E227",
                                 @"E228",
                                 @"E229"];

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
