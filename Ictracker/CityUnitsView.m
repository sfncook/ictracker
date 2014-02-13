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

- (id)initWithFrame:(CGRect)frame units:(NSDictionary*)units delegate:(id<CityUnitMenuDelegate>)cityUnitMenuDelegate
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _cityUnitMenuDelegate = cityUnitMenuDelegate;
        [CityUnitsView appendUnits:units];
        
        //Layout units
        double orig_x = [Utils millimetersToPixels:1.0];
        double orig_y = [Utils millimetersToPixels:1.5];
        int many_cols = 10;
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
        self.contentSize = CGSizeMake(frame.size.width, y+[Utils millimetersToPixels:28]);
    }//if self
    return self;
}

+ (NSMutableDictionary *)allUnits
{
    static NSMutableDictionary* allUnits;
    
    @synchronized(self)
    {
        if (!allUnits)
            allUnits = [[NSMutableDictionary alloc] init];
        
        return allUnits;
    }
}

+ (void)appendUnits:(NSDictionary*)newUnitsD
{
    @synchronized(self) {
        NSMutableDictionary* oldUnitsD = [CityUnitsView allUnits];
        for ( int unitType=UNITTYPE_ENGINE ; unitType<UNITTYPE_MANY; unitType++){
            NSArray* oldUnits = [oldUnitsD objectForKey:[NSNumber numberWithInt:unitType]];
            NSArray* newUnits = [newUnitsD objectForKey:[NSNumber numberWithInt:unitType]];
            NSMutableSet* unionUnits = [[NSMutableSet alloc] initWithArray:oldUnits];
            [unionUnits addObjectsFromArray:newUnits];
            NSArray* sortedArray = [[unionUnits allObjects] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
            [oldUnitsD setObject:sortedArray forKey:[NSNumber numberWithInt:unitType]];
        }
    }
}

- (void) click:(id)selector
{
    if(_cityUnitMenuDelegate!=nil) {
        ButtonView* unitButton = selector;
        [_cityUnitMenuDelegate onSelectedUnit:[unitButton name]];
    }
}

@end
