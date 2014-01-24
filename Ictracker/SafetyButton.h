//
//  SafetyButton.h
//  Ictracker
//
//  Created by S. Cook on 1/23/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonView.h"
#import "ButtonClickDelegate.h"

@interface SafetyButton : ButtonView<ButtonClickDelegate>

@property (readonly, retain, nonatomic)  NSMutableArray* safetyButtons;
@property (retain, nonatomic)  NSString* mySafety;

@end
