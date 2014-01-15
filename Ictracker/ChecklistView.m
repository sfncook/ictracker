//
//  ChecklistView.m
//  Ictracker
//
//  Created by S. Cook on 1/13/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "ChecklistView.h"
#import "Utils.h"
#import "ButtonView.h"

@implementation ChecklistView

- (id)initWithItems:(NSArray*)itemNames
{
    CGRect frame = CGRectMake(
                              0.0,
                              0.0,
                              [Utils millimetersToPixels:57],
                              [Utils windowWidth]-[Utils millimetersToPixels:5]);
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor redColor];
        
        double orig_x = 1.0;//mm
        double orig_y = 1.0;//mm
        double x = orig_x;
        double y = orig_y;
        int many_cols = 1;
        int col = 1;
        for (NSString *itemName in itemNames) {
            ButtonView* btn = [[ButtonView alloc] initWithName:itemName delegate:self size:CHECK_WIDE];
            [self addSubview:btn];
            [btn setPosition:CGPointMake(
                                         [Utils millimetersToPixels:x],
                                         [Utils millimetersToPixels:y])];
            if(col%many_cols==0) {
                col=1;
                x = orig_x;
                y += 8;
            } else {
                col++;
                x += 28;
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
