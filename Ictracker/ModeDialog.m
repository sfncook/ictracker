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
        _defensiveButton = [[ButtonView alloc] initWithName:[ModeButton modeToString:MODE_DEFENSIVE]  delegate:self size:BUTTON_WIDE];
        _marginalButton = [[ButtonView alloc] initWithName:[ModeButton modeToString:MODE_MARGINAL]  delegate:self size:BUTTON_WIDE];
        
        [self addSubview:_offensiveButton];
        [self addSubview:_defensiveButton];
        [self addSubview:_marginalButton];
        
        [_offensiveButton setPosition:CGPointMake([Utils millimetersToPixels:2], [Utils millimetersToPixels:8.5])];
        [_defensiveButton setPosition:CGPointMake(_offensiveButton.frame.origin.x,
                                                   _offensiveButton.frame.origin.y+_offensiveButton.frame.size.height+[Utils millimetersToPixels:1])];
        [_marginalButton setPosition:CGPointMake(_defensiveButton.frame.origin.x,
                                                 _defensiveButton.frame.origin.y+_defensiveButton.frame.size.height+[Utils millimetersToPixels:1])];
        
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
        
    } else if (selector==_defensiveButton) {
        
    } else {
    }
}

@end
