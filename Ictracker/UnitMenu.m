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
        [self addSubview:_mesaCityButton];
        [_mesaCityButton setPosition:CGPointMake(
            [Utils millimetersToPixels:0.5],
            [Utils millimetersToPixels:0.5])];
        
        _ajCityButton = [[ButtonView alloc] initWithName:@"AJ" delegate:self size:BUTTON_MEDIUM];
        [self addSubview:_ajCityButton];
        [_ajCityButton setPosition:CGPointMake(
             _mesaCityButton.frame.origin.x + _mesaCityButton.frame.size.width + [Utils millimetersToPixels:1],
             [Utils millimetersToPixels:0.5])];
        
        _gilbertCityButton = [[ButtonView alloc] initWithName:@"Glbt" delegate:self size:BUTTON_MEDIUM];
        [self addSubview:_gilbertCityButton];
        [_gilbertCityButton setPosition:CGPointMake(
                                                   _ajCityButton.frame.origin.x + _ajCityButton.frame.size.width + [Utils millimetersToPixels:1],
                                                   [Utils millimetersToPixels:0.5])];
        
        
        
        _mesaUnitsView = [[MesaUnitsView alloc] init];
        _ajUnitsView = [[AjUnitsView alloc] init];
        _gilbertUnitsView = [[GilbertUnitsView alloc] init];
        
        [self addSubview:_mesaUnitsView];
        [self addSubview:_ajUnitsView];
        [self addSubview:_gilbertUnitsView];
        
        [self showMesa];
    }
    return self;
}

- (void) showMesa
{
    _mesaUnitsView.hidden = NO;
    _ajUnitsView.hidden = YES;
    _gilbertUnitsView.hidden = YES;
}

- (void) showAj
{
    _mesaUnitsView.hidden = YES;
    _ajUnitsView.hidden = NO;
    _gilbertUnitsView.hidden = YES;
}

- (void) showGilbert
{
    _mesaUnitsView.hidden = YES;
    _ajUnitsView.hidden = YES;
    _gilbertUnitsView.hidden = NO;
}

- (void) click:(id)selector
{
    if(selector==_mesaCityButton) {
        [self showMesa];
    } else if(selector==_ajCityButton) {
        [self showAj];
    } else if(selector==_gilbertCityButton) {
        [self showGilbert];
    }
}

@end
