//
//  UnitMenu.m
//  Ictracker
//
//  Created by S. Cook on 1/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "UnitMenu.h"
#import "Utils.h"
#import "CityUnitMenuDelegate.h"

@implementation UnitMenu

- (id)initWithCityUnitMenuDelegate:(id<CityUnitMenuDelegate>)cityUnitMenuDelegate
{
    CGRect frame = CGRectMake(
                              0.0,
                              0.0,
                              [Utils millimetersToPixels:57],
                              [Utils windowWidth]-[Utils millimetersToPixels:5]);
    self = [super initWithFrame:frame];
    if (self) {
        
        _mesaCityButton = [[ButtonView alloc] initWithName:@"Mesa" delegate:self size:BUTTON_SMALL];
        [self addSubview:_mesaCityButton];
        [_mesaCityButton setPosition:CGPointMake(
            [Utils millimetersToPixels:1],
            [Utils millimetersToPixels:1])];
        
        _ajCityButton = [[ButtonView alloc] initWithName:@"AJ" delegate:self size:BUTTON_SMALL];
        [self addSubview:_ajCityButton];
        [_ajCityButton setPosition:CGPointMake(
             _mesaCityButton.frame.origin.x + _mesaCityButton.frame.size.width + [Utils millimetersToPixels:2],
             [Utils millimetersToPixels:1])];
        
        _gilbertCityButton = [[ButtonView alloc] initWithName:@"Glbt" delegate:self size:BUTTON_SMALL];
        [self addSubview:_gilbertCityButton];
        [_gilbertCityButton setPosition:CGPointMake(
                                                   _ajCityButton.frame.origin.x + _ajCityButton.frame.size.width + [Utils millimetersToPixels:2],
                                                   [Utils millimetersToPixels:1])];
        
        
        _mesaUnitsView = [[MesaUnitsView alloc] initWithDelegate:cityUnitMenuDelegate];
        _ajUnitsView = [[AjUnitsView alloc] initWithDelegate:cityUnitMenuDelegate];
        _gilbertUnitsView = [[GilbertUnitsView alloc] initWithDelegate:cityUnitMenuDelegate];
        
        [self addSubview:_mesaUnitsView];
        [self addSubview:_ajUnitsView];
        [self addSubview:_gilbertUnitsView];
        
        [self showMesa];
    }
    return self;
}

- (void) showMesa
{
    [self resetCityButtons];
    [_mesaCityButton setIsHighlighted:YES];
    _mesaUnitsView.hidden = NO;
    _ajUnitsView.hidden = YES;
    _gilbertUnitsView.hidden = YES;
}

- (void) showAj
{
    [self resetCityButtons];
    [_ajCityButton setIsHighlighted:YES];
    _mesaUnitsView.hidden = YES;
    _ajUnitsView.hidden = NO;
    _gilbertUnitsView.hidden = YES;
}

- (void) showGilbert
{
    [self resetCityButtons];
    [_gilbertCityButton setIsHighlighted:YES];
    _mesaUnitsView.hidden = YES;
    _ajUnitsView.hidden = YES;
    _gilbertUnitsView.hidden = NO;
}

- (void) resetCityButtons {
    [_mesaCityButton setIsHighlighted:NO];
    [_ajCityButton setIsHighlighted:NO];
    [_gilbertCityButton setIsHighlighted:NO];
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
