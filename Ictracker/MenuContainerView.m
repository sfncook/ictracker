//
//  MenuContainerView.m
//  Ictracker
//
//  Created by S. Cook on 1/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "MenuContainerView.h"
#import "Utils.h"

@implementation MenuContainerView

- (id)initWithSectorMenuDelegate:(id<SectorMenuDelegate>)sectorMenuDelegate
            cityUnitMenuDelegate:(id<CityUnitMenuDelegate>)cityUnitMenuDelegate
              actionMenuDelegate:(id<ActionMenuDelegate>)actionMenuDelegate
{
    CGRect frame = CGRectMake(
                              [Utils millimetersToPixels:13],
                              [Utils millimetersToPixels:13],
                              [Utils millimetersToPixels:57],
                              [Utils windowWidth]-[Utils millimetersToPixels:5]);
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.borderWidth = 1.0;
        self.layer.borderColor = [UIColor colorWithRed:0.4 green:0.8 blue:0.8 alpha:1.0].CGColor;
        
        _unitMenu = [[UnitMenu alloc] initWithCityUnitMenuDelegate:cityUnitMenuDelegate];
        [self addSubview:_unitMenu];
        
        _sectorMenu = [[SectorMenu alloc] initWithDelegate:sectorMenuDelegate];
        [self addSubview:_sectorMenu];
        
        _actionsMenu = [[ActionsMenu alloc] initWithDelegate:actionMenuDelegate];
        [self addSubview:_actionsMenu];
        
        
        
        _benchmarksMenu = [[BenchmarksMenu alloc] init];
        [self addSubview:_benchmarksMenu];
        
        _objectivesMenu = [[ObjectivesMenu alloc] init];
        [self addSubview:_objectivesMenu];
        
        
        
        _osrMenu = [[OsrMenu alloc] init];
        [self addSubview:_osrMenu];
        
        [self showUnits];
    }
    return self;
}

- (void) showUnits
{
    _unitMenu.hidden = NO;
    _sectorMenu.hidden = YES;
    _actionsMenu.hidden = YES;
    _benchmarksMenu.hidden = YES;
    _objectivesMenu.hidden = YES;
    _osrMenu.hidden = YES;
    _notesMenu.hidden = YES;
}

- (void) showSectors
{
    _unitMenu.hidden = YES;
    _sectorMenu.hidden = NO;
    _actionsMenu.hidden = YES;
    _benchmarksMenu.hidden = YES;
    _objectivesMenu.hidden = YES;
    _osrMenu.hidden = YES;
    _notesMenu.hidden = YES;
}

- (void) showActions
{
    _unitMenu.hidden = YES;
    _sectorMenu.hidden = YES;
    _actionsMenu.hidden = NO;
    _benchmarksMenu.hidden = YES;
    _objectivesMenu.hidden = YES;
    _osrMenu.hidden = YES;
    _notesMenu.hidden = YES;
}

- (void) showBenchmarks
{
    _unitMenu.hidden = YES;
    _sectorMenu.hidden = YES;
    _actionsMenu.hidden = YES;
    _benchmarksMenu.hidden = NO;
    _objectivesMenu.hidden = YES;
    _osrMenu.hidden = YES;
    _notesMenu.hidden = YES;
}

- (void) showObjectives
{
    _unitMenu.hidden = YES;
    _sectorMenu.hidden = YES;
    _actionsMenu.hidden = YES;
    _benchmarksMenu.hidden = YES;
    _objectivesMenu.hidden = NO;
    _osrMenu.hidden = YES;
    _notesMenu.hidden = YES;
}

- (void) showOsr
{
    _unitMenu.hidden = YES;
    _sectorMenu.hidden = YES;
    _actionsMenu.hidden = YES;
    _benchmarksMenu.hidden = YES;
    _objectivesMenu.hidden = YES;
    _osrMenu.hidden = NO;
    _notesMenu.hidden = YES;
}

- (void) showNotes
{
    _unitMenu.hidden = YES;
    _sectorMenu.hidden = YES;
    _actionsMenu.hidden = YES;
    _benchmarksMenu.hidden = YES;
    _objectivesMenu.hidden = YES;
    _osrMenu.hidden = YES;
    _notesMenu.hidden = NO;
}

@end
