//
//  MenuSelectorDelegate.h
//  Ictracker
//
//  Created by S. Cook on 1/13/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MenuSelectorDelegate <NSObject>

- (void) showUnits;
- (void) showSectors;
- (void) showActions;
- (void) showBenchmarks;
- (void) showObjectives;
- (void) showOsr;
- (void) showNotes;

@end
