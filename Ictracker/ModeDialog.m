//
//  ModeDialog.m
//  Ictracker
//
//  Created by S. Cook on 1/22/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "ModeDialog.h"
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
        
        _offensiveButton = [[ModeButton alloc] initWithDelegate:self size:BUTTON_WIDE];
        _marginalButton = [[ModeButton alloc] initWithDelegate:self size:BUTTON_WIDE];
        _defensiveButton = [[ModeButton alloc] initWithDelegate:self size:BUTTON_WIDE];
        
        [self addSubview:_offensiveButton];
        [self addSubview:_marginalButton];
        [self addSubview:_defensiveButton];
        
        [_offensiveButton setPosition:CGPointMake([Utils millimetersToPixels:2], [Utils millimetersToPixels:8.5])];
        [_marginalButton setPosition:CGPointMake(_offensiveButton.frame.origin.x,
                                                 _offensiveButton.frame.origin.y+_offensiveButton.frame.size.height+[Utils millimetersToPixels:1])];
        [_defensiveButton setPosition:CGPointMake(_marginalButton.frame.origin.x,
                                                  _marginalButton.frame.origin.y+_marginalButton.frame.size.height+[Utils millimetersToPixels:1])];
        
        [_offensiveButton setMode:MODE_OFFENSIVE];
        [_defensiveButton setMode:MODE_DEFENSIVE];
        [_marginalButton setMode:MODE_MARGINAL];
    }
    return self;
}

- (void) setPosition:(CGPoint)position
{
    self.frame = CGRectMake(position.x, position.y, self.frame.size.width, self.frame.size.height);
}

- (void) setMode:(Mode)mode {
    _curMode = mode;
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

//*** ModeButtonDialog ***
- (void) clickModeButton:(Mode)currentMode {
    if (currentMode!=_curMode) {
        [_delegate selectNewMode:currentMode];
    } else {
        [_delegate cancelModeDialog];
    }
}

- (void) cancelModeDialog {
    //do nothing
}

- (void) selectNewMode:(Mode)newMode {
    //do nothing
}


@end
