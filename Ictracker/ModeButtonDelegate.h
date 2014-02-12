//
//  ModeButtonDelegate.h
//  Ictracker
//
//  Created by S. Cook on 1/22/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum modes {
    MODE_OFFENSIVE,
    MODE_DEFENSIVE,
} Mode;

@protocol ModeButtonDelegate <NSObject>

- (void) clickModeButton:(Mode)currentMode;
- (void) cancelModeDialog;
- (void) selectNewMode:(Mode)newMode;

@end
