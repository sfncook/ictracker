//
//  ShowMenuDelegate.h
//  Ictracker
//
//  Created by S. Cook on 1/19/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ShowMenuDelegate <NSObject>

- (void) showUnits;
- (void) showSectors;
- (void) showActions;
- (void) showBenchmarks;
- (void) showObjectives;
- (void) showOsr;
- (void) showNotes;

@end
