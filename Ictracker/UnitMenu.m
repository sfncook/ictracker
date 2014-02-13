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

- (id)initWithFrame:(CGRect)frame cityUnitMenuDelegate:(id<CityUnitMenuDelegate>)cityUnitMenuDelegate
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _allCitiesButton = [[ButtonView alloc] initWithName:@"ALL" delegate:self size:BUTTON_SMALL];
        [self addSubview:_allCitiesButton];
        [_allCitiesButton setPosition:CGPointMake(
                                                 [Utils millimetersToPixels:1],
                                                 [Utils millimetersToPixels:1])];
        
        _mesaCityButton = [[ButtonView alloc] initWithName:@"Mesa" delegate:self size:BUTTON_SMALL];
        [self addSubview:_mesaCityButton];
        [_mesaCityButton setPosition:CGPointMake(
                                                _allCitiesButton.frame.origin.x + _allCitiesButton.frame.size.width + [Utils millimetersToPixels:2],
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
        
        _queenCreekButton = [[ButtonView alloc] initWithName:@"QC" delegate:self size:BUTTON_SMALL];
        [self addSubview:_queenCreekButton];
        [_queenCreekButton setPosition:CGPointMake(
                                                    _gilbertCityButton.frame.origin.x + _gilbertCityButton.frame.size.width + [Utils millimetersToPixels:2],
                                                    [Utils millimetersToPixels:1])];
        
        _tempeButton = [[ButtonView alloc] initWithName:@"Tmpe" delegate:self size:BUTTON_SMALL];
        [self addSubview:_tempeButton];
        [_tempeButton setPosition:CGPointMake(
                                                   _queenCreekButton.frame.origin.x + _queenCreekButton.frame.size.width + [Utils millimetersToPixels:2],
                                                   [Utils millimetersToPixels:1])];
        
        _chandlerButton = [[ButtonView alloc] initWithName:@"Chdlr" delegate:self size:BUTTON_SMALL];
        [self addSubview:_chandlerButton];
        [_chandlerButton setPosition:CGPointMake(
                                              _allCitiesButton.frame.origin.x,
                                              _allCitiesButton.frame.origin.y + _allCitiesButton.frame.size.height + [Utils millimetersToPixels:1])];
        
        
        _mesaUnitsView = [[MesaUnitsView alloc] initWithFrame:frame delegate:cityUnitMenuDelegate];
        _ajUnitsView = [[AjUnitsView alloc] initWithFrame:frame delegate:cityUnitMenuDelegate];
        _gilbertUnitsView = [[GilbertUnitsView alloc] initWithFrame:frame delegate:cityUnitMenuDelegate];
        _queenCreekUnitsView = [[QueenCreekUnitsView alloc] initWithFrame:frame delegate:cityUnitMenuDelegate];
        _tempeUnitsView = [[TempeUnitsView alloc] initWithFrame:frame delegate:cityUnitMenuDelegate];
        _chandlerUnitsView = [[ChandlerUnitsView alloc] initWithFrame:frame delegate:cityUnitMenuDelegate];
        _allCitiesUnitsView = [[CityUnitsView alloc] initWithFrame:frame units:[CityUnitsView allUnits] delegate:cityUnitMenuDelegate];
        
        [self addSubview:_allCitiesUnitsView];
        [self addSubview:_mesaUnitsView];
        [self addSubview:_ajUnitsView];
        [self addSubview:_gilbertUnitsView];
        [self addSubview:_queenCreekUnitsView];
        [self addSubview:_tempeUnitsView];
        [self addSubview:_chandlerUnitsView];
        
        [self showMesa];
    }
    return self;
}

- (void) showAll
{
    [self resetCityButtons];
    [_allCitiesButton setIsHighlighted:YES];
    [self hideAllCityViews];
    _allCitiesUnitsView.hidden = NO;
}

- (void) showMesa
{
    [self resetCityButtons];
    [_mesaCityButton setIsHighlighted:YES];
    [self hideAllCityViews];
    _mesaUnitsView.hidden = NO;
}

- (void) showAj
{
    [self resetCityButtons];
    [_ajCityButton setIsHighlighted:YES];
    [self hideAllCityViews];
    _ajUnitsView.hidden = NO;
}

- (void) showGilbert
{
    [self resetCityButtons];
    [_gilbertCityButton setIsHighlighted:YES];
    [self hideAllCityViews];
    _gilbertUnitsView.hidden = NO;
}

- (void) showQueenCreek
{
    [self resetCityButtons];
    [_queenCreekButton setIsHighlighted:YES];
    [self hideAllCityViews];
    _queenCreekUnitsView.hidden = NO;
}

- (void) showTempe
{
    [self resetCityButtons];
    [_tempeButton setIsHighlighted:YES];
    [self hideAllCityViews];
    _tempeUnitsView.hidden = NO;
}

- (void) showChandler
{
    [self resetCityButtons];
    [_chandlerButton setIsHighlighted:YES];
    [self hideAllCityViews];
    _chandlerUnitsView.hidden = NO;
}

- (void) resetCityButtons {
    [_allCitiesButton setIsHighlighted:NO];
    [_mesaCityButton setIsHighlighted:NO];
    [_ajCityButton setIsHighlighted:NO];
    [_gilbertCityButton setIsHighlighted:NO];
    [_queenCreekButton setIsHighlighted:NO];
    [_tempeButton setIsHighlighted:NO];
    [_chandlerButton setIsHighlighted:NO];
}

- (void) hideAllCityViews {
    _allCitiesUnitsView.hidden = YES;
    _mesaUnitsView.hidden = YES;
    _ajUnitsView.hidden = YES;
    _gilbertUnitsView.hidden = YES;
    _queenCreekUnitsView.hidden = YES;
    _tempeUnitsView.hidden = YES;
    _chandlerUnitsView.hidden = YES;
}

- (void) click:(id)selector
{
    if(selector==_allCitiesButton) {
        [self showAll];
    } else if(selector==_mesaCityButton) {
        [self showMesa];
    } else if(selector==_ajCityButton) {
        [self showAj];
    } else if(selector==_gilbertCityButton) {
        [self showGilbert];
    } else if(selector==_queenCreekButton) {
        [self showQueenCreek];
    } else if(selector==_tempeButton) {
        [self showTempe];
    } else if(selector==_chandlerButton) {
        [self showChandler];
    }
}

- (void) setMyFrame:(CGRect)frame {
    self.frame = frame;
    
    _allCitiesUnitsView.contentSize = frame.size;
    _mesaUnitsView.contentSize = frame.size;
    _ajUnitsView.contentSize = frame.size;
    _gilbertUnitsView.contentSize = frame.size;
    _queenCreekUnitsView.contentSize = frame.size;
    _tempeUnitsView.contentSize = frame.size;
    _chandlerUnitsView.contentSize = frame.size;
}

@end
