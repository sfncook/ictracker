//
//  MesaUnitsView.m
//  Ictracker
//
//  Created by S. Cook on 1/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "MesaUnitsView.h"
#import "Utils.h"

@implementation MesaUnitsView

- (id)init
{
    CGRect frame = CGRectMake(
                              [Utils millimetersToPixels:9.5],
                              [Utils millimetersToPixels:7],
                              [Utils millimetersToPixels:47],
                              [Utils windowWidth]-[Utils millimetersToPixels:10]);
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor purpleColor];
        
        _e201 = [[ButtonView alloc] initWithName:@"E201" delegate:self size:BUTTON_MEDIUM];
        _e202 = [[ButtonView alloc] initWithName:@"E202" delegate:self size:BUTTON_MEDIUM];
        _e203 = [[ButtonView alloc] initWithName:@"E203" delegate:self size:BUTTON_MEDIUM];
        _e204 = [[ButtonView alloc] initWithName:@"E204" delegate:self size:BUTTON_MEDIUM];
        _e205 = [[ButtonView alloc] initWithName:@"E205" delegate:self size:BUTTON_MEDIUM];
        _e206 = [[ButtonView alloc] initWithName:@"E206" delegate:self size:BUTTON_MEDIUM];
        _e207 = [[ButtonView alloc] initWithName:@"E207" delegate:self size:BUTTON_MEDIUM];
        _e208 = [[ButtonView alloc] initWithName:@"E208" delegate:self size:BUTTON_MEDIUM];
        _e209 = [[ButtonView alloc] initWithName:@"E209" delegate:self size:BUTTON_MEDIUM];
        _e210 = [[ButtonView alloc] initWithName:@"E210" delegate:self size:BUTTON_MEDIUM];
        _e211 = [[ButtonView alloc] initWithName:@"E211" delegate:self size:BUTTON_MEDIUM];
        _e212 = [[ButtonView alloc] initWithName:@"E212" delegate:self size:BUTTON_MEDIUM];
        _e213 = [[ButtonView alloc] initWithName:@"E213" delegate:self size:BUTTON_MEDIUM];
        _e214 = [[ButtonView alloc] initWithName:@"E214" delegate:self size:BUTTON_MEDIUM];
        _e215 = [[ButtonView alloc] initWithName:@"E215" delegate:self size:BUTTON_MEDIUM];
        _e216 = [[ButtonView alloc] initWithName:@"E216" delegate:self size:BUTTON_MEDIUM];
        _e217 = [[ButtonView alloc] initWithName:@"E217" delegate:self size:BUTTON_MEDIUM];
        _e218 = [[ButtonView alloc] initWithName:@"E218" delegate:self size:BUTTON_MEDIUM];
        _e219 = [[ButtonView alloc] initWithName:@"E219" delegate:self size:BUTTON_MEDIUM];
        _e220 = [[ButtonView alloc] initWithName:@"E220" delegate:self size:BUTTON_MEDIUM];
        _e221 = [[ButtonView alloc] initWithName:@"E221" delegate:self size:BUTTON_MEDIUM];
        _e222 = [[ButtonView alloc] initWithName:@"E222" delegate:self size:BUTTON_MEDIUM];
        _e223 = [[ButtonView alloc] initWithName:@"E223" delegate:self size:BUTTON_MEDIUM];
        _e224 = [[ButtonView alloc] initWithName:@"E224" delegate:self size:BUTTON_MEDIUM];
        _e225 = [[ButtonView alloc] initWithName:@"E225" delegate:self size:BUTTON_MEDIUM];
        _e226 = [[ButtonView alloc] initWithName:@"E226" delegate:self size:BUTTON_MEDIUM];
        _e227 = [[ButtonView alloc] initWithName:@"E227" delegate:self size:BUTTON_MEDIUM];
        _e228 = [[ButtonView alloc] initWithName:@"E228" delegate:self size:BUTTON_MEDIUM];
        _e229 = [[ButtonView alloc] initWithName:@"E229" delegate:self size:BUTTON_MEDIUM];
        
        [self addSubview:_e201];
        [self addSubview:_e202];
        [self addSubview:_e203];
        [self addSubview:_e204];
        [self addSubview:_e205];
        [self addSubview:_e206];
        [self addSubview:_e207];
        [self addSubview:_e208];
        [self addSubview:_e209];
        [self addSubview:_e210];
        [self addSubview:_e211];
        [self addSubview:_e212];
        [self addSubview:_e213];
        [self addSubview:_e214];
        [self addSubview:_e215];
        [self addSubview:_e216];
        [self addSubview:_e217];
        [self addSubview:_e218];
        [self addSubview:_e219];
        [self addSubview:_e220];
        [self addSubview:_e221];
        [self addSubview:_e222];
        [self addSubview:_e223];
        [self addSubview:_e224];
        [self addSubview:_e225];
        [self addSubview:_e226];
        [self addSubview:_e227];
        [self addSubview:_e228];
        [self addSubview:_e229];
        
        // Row 1
        [_e201 setPosition:CGPointMake(
                                     [Utils millimetersToPixels:1],
                                     [Utils millimetersToPixels:1])];
        [_e202 setPosition:CGPointMake(
                                      [Utils millimetersToPixels:10],
                                      [Utils millimetersToPixels:1])];
        [_e203 setPosition:CGPointMake(
                                       [Utils millimetersToPixels:19],
                                       [Utils millimetersToPixels:1])];
        [_e204 setPosition:CGPointMake(
                                       [Utils millimetersToPixels:28],
                                       [Utils millimetersToPixels:1])];
        [_e205 setPosition:CGPointMake(
                                       [Utils millimetersToPixels:37],
                                       [Utils millimetersToPixels:1])];
        
        // Row 2
        [_e206 setPosition:CGPointMake(
                                       [Utils millimetersToPixels:1],
                                       [Utils millimetersToPixels:8])];
        [_e207 setPosition:CGPointMake(
                                       [Utils millimetersToPixels:10],
                                       [Utils millimetersToPixels:8])];
        [_e208 setPosition:CGPointMake(
                                       [Utils millimetersToPixels:19],
                                       [Utils millimetersToPixels:8])];
        [_e209 setPosition:CGPointMake(
                                       [Utils millimetersToPixels:28],
                                       [Utils millimetersToPixels:8])];
        [_e210 setPosition:CGPointMake(
                                       [Utils millimetersToPixels:37],
                                       [Utils millimetersToPixels:8])];
    }
    return self;
}


- (void) click:(id)selector
{
}


@end
