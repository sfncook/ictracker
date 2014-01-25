//
//  SafetyButtonDelegate.h
//  Ictracker
//
//  Created by S. Cook on 1/24/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SafetyButtonDelegate <NSObject>
- (void) clickSafetyButton:(NSString*)currentSafety;
- (void) cancelSafetyDialog;
- (void) selectNewSafety:(NSString*)newSafety;
@end
