//
//  ModeDialog.m
//  Ictracker
//
//  Created by S. Cook on 1/22/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "ModeDialog.h"
#import "ButtonView.h"
#import "ModeButton.h"
#import "Utils.h"

@implementation ModeDialog

- (id)initWithDelegate:(id<ModeButtonDelegate>)delegate
{
    CGRect frame = CGRectMake(0.0, 0.0, [Utils millimetersToPixels:31.0], [Utils millimetersToPixels:27.0]);
    self = [super initWithFrame:frame];
    if (self) {
        _delegate = delegate;
        self.backgroundColor = [UIColor lightGrayColor];
        self.layer.borderColor = [UIColor darkGrayColor].CGColor;
        self.layer.borderWidth = 1.5;
        self.layer.cornerRadius = 5.0;
        self.layer.masksToBounds = YES;
        
        _offensiveButton = [[ButtonView alloc] initWithName:[ModeButton modeToString:MODE_OFFENSIVE]  delegate:self size:BUTTON_WIDE];
        _marginalButton = [[ButtonView alloc] initWithName:[ModeButton modeToString:MODE_MARGINAL]  delegate:self size:BUTTON_WIDE];
        _defensiveButton = [[ButtonView alloc] initWithName:[ModeButton modeToString:MODE_DEFENSIVE]  delegate:self size:BUTTON_WIDE];
        
        [self addSubview:_offensiveButton];
        [self addSubview:_marginalButton];
        [self addSubview:_defensiveButton];
        
        [_offensiveButton setPosition:CGPointMake([Utils millimetersToPixels:2], [Utils millimetersToPixels:8.5])];
        [_marginalButton setPosition:CGPointMake(_offensiveButton.frame.origin.x,
                                                 _offensiveButton.frame.origin.y+_offensiveButton.frame.size.height+[Utils millimetersToPixels:1])];
        [_defensiveButton setPosition:CGPointMake(_marginalButton.frame.origin.x,
                                                  _marginalButton.frame.origin.y+_marginalButton.frame.size.height+[Utils millimetersToPixels:1])];
        
        [_offensiveButton setNormalColor:[UIColor colorWithRed:0.7 green:1.0 blue:0.7 alpha:1.0]];
        [_marginalButton setNormalColor:[UIColor colorWithRed:1.0 green:0.9 blue:0.9 alpha:1.0]];
        [_defensiveButton setNormalColor:[UIColor colorWithRed:1.0 green:0.6 blue:0.6 alpha:1.0]];
    }
    return self;
}

- (void) setPosition:(CGPoint)position
{
    self.frame = CGRectMake(position.x, position.y, self.frame.size.width, self.frame.size.height);
}

- (void) setMode:(Mode)mode {
    switch (mode) {
        case MODE_OFFENSIVE:
            [_offensiveButton setIsHighlighted:YES];
            [_defensiveButton setIsHighlighted:NO];
            [_marginalButton setIsHighlighted:NO];
            break;
        case MODE_DEFENSIVE:
            [_offensiveButton setIsHighlighted:NO];
            [_defensiveButton setIsHighlighted:YES];
            [_marginalButton setIsHighlighted:NO];
            break;
        case MODE_MARGINAL:
            [_offensiveButton setIsHighlighted:NO];
            [_defensiveButton setIsHighlighted:NO];
            [_marginalButton setIsHighlighted:YES];
            break;
            
        default:
            break;
    }
}

- (void) click:(id)selector {
    if (selector==_offensiveButton) {
        [_delegate selectNewMode:MODE_OFFENSIVE];
    } else if (selector==_defensiveButton) {
        [_delegate selectNewMode:MODE_DEFENSIVE];
    } else {
        [_delegate selectNewMode:MODE_MARGINAL];
    }
}

@end
