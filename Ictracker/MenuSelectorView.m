//
//  MenuSelectorView.m
//  Ictracker
//
//  Created by S. Cook on 1/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "MenuSelectorView.h"
#import "Utils.h"

@implementation MenuSelectorView

- (id)initWithDelegate:(id<MenuSelectorDelegate>)selectorDelegate_
{
    CGRect frame = CGRectMake(0,
               [Utils millimetersToPixels:13],
               [Utils millimetersToPixels:13],
               [Utils windowWidth]-[Utils millimetersToPixels:5]);
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
        _selectorDelegate = selectorDelegate_;
        
        _unitsButton = [[ButtonView alloc] initWithName:@"Units" delegate:self size:BUTTON_LARGE];
        [_unitsButton setPosition:CGPointMake(
                                            [Utils millimetersToPixels:0.5]-1,
                                            [Utils millimetersToPixels:0.5])];
        [self addSubview:_unitsButton];
        
        _sectorsButton = [[ButtonView alloc] initWithName:@"Sectors" delegate:self size:BUTTON_LARGE];
        [_sectorsButton setPosition:CGPointMake(
                                              [Utils millimetersToPixels:0.5]-1,
                                              _unitsButton.frame.origin.y + _unitsButton.frame.size.height + [Utils millimetersToPixels:1] - 1)];
        [self addSubview:_sectorsButton];
        
        _actionsButton = [[ButtonView alloc] initWithName:@"Actions" delegate:self size:BUTTON_LARGE];
        [_actionsButton setPosition:CGPointMake(
                                                [Utils millimetersToPixels:0.5]-1,
                                                _sectorsButton.frame.origin.y + _sectorsButton.frame.size.height + [Utils millimetersToPixels:1])];
        [self addSubview:_actionsButton];
        
        
        
        
        _benchmarksButton = [[ButtonView alloc] initWithName:@"Bench" delegate:self size:BUTTON_LARGE];
        [_benchmarksButton setPosition:CGPointMake(
                                                [Utils millimetersToPixels:0.5]-1,
                                                [Utils millimetersToPixels:45])];
        [self addSubview:_benchmarksButton];
        
        _objectivesButton = [[ButtonView alloc] initWithName:@"Objctv" delegate:self size:BUTTON_LARGE];
        [_objectivesButton setPosition:CGPointMake(
                                                [Utils millimetersToPixels:0.5]-1,
                                                _benchmarksButton.frame.origin.y + _benchmarksButton.frame.size.height + [Utils millimetersToPixels:1])];
        [self addSubview:_objectivesButton];
        
        
        
        _osrButton = [[ButtonView alloc] initWithName:@"OSR" delegate:self size:BUTTON_LARGE];
        [_osrButton setPosition:CGPointMake(
                                                   [Utils millimetersToPixels:0.5]-1,
                                                   [Utils millimetersToPixels:80])];
        [self addSubview:_osrButton];
        
        _notesButton = [[ButtonView alloc] initWithName:@"Notes" delegate:self size:BUTTON_LARGE];
        [_notesButton setPosition:CGPointMake(
                                                   [Utils millimetersToPixels:0.5]-1,
                                                   _osrButton.frame.origin.y + _osrButton.frame.size.height + [Utils millimetersToPixels:1])];
        [self addSubview:_notesButton];
        
        
    }
    return self;
}

- (void) click:(id)selector
{
    if(selector==_unitsButton) {
        [_selectorDelegate showUnits];
    } else if(selector==_sectorsButton) {
        [_selectorDelegate showSectors];
    } else if(selector==_actionsButton) {
        [_selectorDelegate showActions];
    } else if(selector==_benchmarksButton) {
        [_selectorDelegate showBenchmarks];
    } else if(selector==_objectivesButton) {
        [_selectorDelegate showObjectives];
    } else if(selector==_osrButton) {
        [_selectorDelegate showOsr];
    } else if(selector==_notesButton) {
        [_selectorDelegate showNotes];
    }
    
    [self resetButtonHighlights];
    [selector setIsHighlighted:YES];
}

- (void) resetButtonHighlights {
    [_unitsButton setIsHighlighted:NO];
    [_sectorsButton setIsHighlighted:NO];
    [_actionsButton setIsHighlighted:NO];
    [_benchmarksButton setIsHighlighted:NO];
    [_objectivesButton setIsHighlighted:NO];
    [_osrButton setIsHighlighted:NO];
    [_notesButton setIsHighlighted:NO];
}

- (void) showUnits
{
    [self resetButtonHighlights];
    [_unitsButton setIsHighlighted:YES];
}

- (void) showSectors
{
    [self resetButtonHighlights];
    [_sectorsButton setIsHighlighted:YES];
}

- (void) showActions
{
    [self resetButtonHighlights];
    [_actionsButton setIsHighlighted:YES];
}

- (void) showBenchmarks
{
    [self resetButtonHighlights];
    [_benchmarksButton setIsHighlighted:YES];
}

- (void) showObjectives
{
    [self resetButtonHighlights];
    [_objectivesButton setIsHighlighted:YES];
}

- (void) showOsr
{
    [self resetButtonHighlights];
    [_osrButton setIsHighlighted:YES];
}

- (void) showNotes
{
    [self resetButtonHighlights];
    [_notesButton setIsHighlighted:YES];
}

@end
