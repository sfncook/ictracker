//
//  UnitMenu.m
//  Ictracker
//
//  Created by S. Cook on 1/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "UnitMenu.h"
#import "Utils.h"

@implementation UnitMenu

- (id)init
{
    CGRect frame = CGRectMake(
                              0.0,
                              0.0,
                              [Utils millimetersToPixels:57],
                              [Utils windowWidth]-[Utils millimetersToPixels:5]);
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
        
        _mesaCityButton = [[ButtonView alloc] initWithName:@"Mesa" delegate:self size:BUTTON_MEDIUM];
        [self addSubview:self.mesaCityButton];
        [self.mesaCityButton setPosition:CGPointMake(
            [Utils millimetersToPixels:0.5],
            [Utils millimetersToPixels:0.5])];
        
        _ajCityButton = [[ButtonView alloc] initWithName:@"AJ" delegate:self size:BUTTON_MEDIUM];
        [self addSubview:self.ajCityButton];
        [self.ajCityButton setPosition:CGPointMake(
             self.mesaCityButton.frame.size.width + [Utils millimetersToPixels:1],
             [Utils millimetersToPixels:0.5])];
        
        _mesaUnitsView = [[MesaUnitsView alloc] init];
        _ajUnitsView = [[AjUnitsView alloc] init];
        [self addSubview:_mesaUnitsView];
        [self addSubview:_ajUnitsView];
    }
    return self;
}

- (void) click:(id)selector
{
    
}

@end
