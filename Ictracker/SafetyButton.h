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
#import "SafetyButtonDelegate.h"

@interface SafetyButton : ButtonView<ButtonClickDelegate>

@property (readonly, nonatomic) id<SafetyButtonDelegate> delegate;
@property (retain, nonatomic)   NSString* mySafety;

- (id)initWithDelegate:(id<SafetyButtonDelegate>)delegate initialSafety:(NSString*)initialSafety;
- (void) setSafety:(NSString*)safety;

@end
