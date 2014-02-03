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
        
        //Layout units
        double orig_x = [Utils millimetersToPixels:1.0];
        double orig_y = [Utils millimetersToPixels:1.5];
        int many_cols = 5;
        double x = orig_x;
        double y = orig_y;
        int row = 0;
        int col = 1;
        for ( int unitType=UNITTYPE_ENGINE ; unitType<UNITTYPE_MANY; unitType++){
            
            NSArray* unitsForType = [units objectForKey:[NSNumber numberWithInt:unitType]];
            if(unitsForType!=nil) {
                if (row==0) {
                    row=1;
                } else {
                    //Seperate unit types by extra space
                    if(col==1)
                        y+=[Utils millimetersToPixels:7];
                    else
                        y+=[Utils millimetersToPixels:14];
                }
                x = orig_x;
                col=1;
                for (NSString *unitName in unitsForType) {
                    ButtonView* btn = [[ButtonView alloc] initWithName:unitName delegate:self size:BUTTON_UNIT];
                    [self addSubview:btn];
                    [btn setPosition:CGPointMake(x,y)];
                    if(col%many_cols==0) {
                        row++;
                        col=1;
                        x = orig_x;
                        y += [Utils millimetersToPixels:7];
                    } else {
                        col++;
                        x += [Utils millimetersToPixels:10.5];
                    }
                }//for
            }//if
        }//for unitType
    }//if self
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
