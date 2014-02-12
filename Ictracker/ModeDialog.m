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
    CGRect frame = CGRectMake(0.0, 0.0, [Utils millimetersToPixels:31.0], [Utils millimetersToPixels:20.0]);
    self = [super initWithFrame:frame];
    if (self) {
        _delegate = delegate;
        self.backgroundColor = [UIColor lightGrayColor];
        self.layer.borderColor = [UIColor darkGrayColor].CGColor;
        self.layer.borderWidth = 1.5;
        self.layer.cornerRadius = 5.0;
        self.layer.masksToBounds = YES;
        
        _offensiveButton = [[ModeButton alloc] initWithDelegate:self size:BUTTON_WIDE];
        _defensiveButton = [[ModeButton alloc] initWithDelegate:self size:BUTTON_WIDE];
        
        [self addSubview:_offensiveButton];
        [self addSubview:_defensiveButton];
        
        float btn_x = self.frame.origin.x+(self.frame.size.width/2)-(_offensiveButton.frame.size.width/2);
        [_offensiveButton setPosition:CGPointMake(btn_x, [Utils millimetersToPixels:8.5])];
        [_defensiveButton setPosition:CGPointMake(_offensiveButton.frame.origin.x,
                                                  _offensiveButton.frame.origin.y+_offensiveButton.frame.size.height+[Utils millimetersToPixels:1])];
        
        frame = CGRectMake(0.0,
                           0.0,
                           [Utils millimetersToPixels:31.0],
                           _defensiveButton.frame.origin.y+_defensiveButton.frame.size.height+[Utils millimetersToPixels:2.0]);
        self.frame = frame;
        
        [_offensiveButton setMode:MODE_OFFENSIVE];
        [_defensiveButton setMode:MODE_DEFENSIVE];
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
            break;
        case MODE_DEFENSIVE:
            [_offensiveButton setIsHighlighted:NO];
            [_defensiveButton setIsHighlighted:YES];
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
