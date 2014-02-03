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

- (id)initWithUnits:(NSDictionary*)units delegate:(id<CityUnitMenuDelegate>)cityUnitMenuDelegate
{
    CGRect frame = CGRectMake(
                              [Utils millimetersToPixels:3.0],
                              [Utils millimetersToPixels:13],
                              [Utils millimetersToPixels:57],
                              [Utils windowWidth]-[Utils millimetersToPixels:10]);
    self = [super initWithFrame:frame];
    if (self) {
        
        _cityUnitMenuDelegate = cityUnitMenuDelegate;
        
    }
    return self;
}

- (id)initWithEngNames:(NSArray*)engNames
              ladNames:(NSArray*)ladNames
               bcNames:(NSArray*)bcNames
              delegate:(id<CityUnitMenuDelegate>)cityUnitMenuDelegate
{
    CGRect frame = CGRectMake(
                              [Utils millimetersToPixels:3.0],
                              [Utils millimetersToPixels:13],
                              [Utils millimetersToPixels:57],
                              [Utils windowWidth]-[Utils millimetersToPixels:10]);
    self = [super initWithFrame:frame];
    if (self) {
        
        _cityUnitMenuDelegate = cityUnitMenuDelegate;
        
        double orig_x = 1.0;//mm
        double orig_y = 1.5;//mm
        double x = orig_x;
        double y = orig_y;
        int many_cols = 5;
        int col = 1;
        for (NSString *unitName in engNames) {
            ButtonView* btn = [[ButtonView alloc] initWithName:unitName delegate:self size:BUTTON_UNIT];
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
                x += 10.5;
            }
        }
        
        
        if(col==1)
            y+=7;
        else
            y+=14;
        col = 1;
        x = orig_x;
        for (NSString *unitName in ladNames) {
            ButtonView* btn = [[ButtonView alloc] initWithName:unitName delegate:self size:BUTTON_UNIT];
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
                x += 10.5;
            }
        }
        
        if(col==1)
            y+=7;
        else
            y+=14;
        col = 1;
        x = orig_x;
        for (NSString *unitName in bcNames) {
            ButtonView* btn = [[ButtonView alloc] initWithName:unitName delegate:self size:BUTTON_UNIT];
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
                x += 10.5;
            }
        }
    }
    return self;
}

- (void) click:(id)selector
{
    if(_cityUnitMenuDelegate!=nil) {
        ButtonView* unitButton = selector;
        [_cityUnitMenuDelegate onSelectedUnit:[unitButton name]];
    }
}

@end
