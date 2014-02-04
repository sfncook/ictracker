//
//  SafetyDialog.h
//  Ictracker
//
//  Created by S. Cook on 1/24/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SafetyButtonDelegate.h"
#import "ButtonClickDelegate.h"

@interface SafetyDialog : UIView<ButtonClickDelegate>

@property (retain, atomic)              NSString* curSafety;
@property (readonly, retain, nonatomic) NSArray* safetyButtons;
@property (readonly, retain, nonatomic) id<SafetyButtonDelegate> delegate;

- (id)initWithDelegate:(id<SafetyButtonDelegate>)delegate safetyNames:(NSArray*)safetyNames;
- (void) setPosition:(CGPoint)position;
- (void) setHeight:(CGFloat)height;
- (void) setSafety:(NSString*)safety;
@end
