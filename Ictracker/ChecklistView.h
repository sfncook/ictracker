//
//  ChecklistView.h
//  Ictracker
//
//  Created by S. Cook on 1/13/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonClickDelegate.h"
#import "TransactionLogger.h"

@interface ChecklistView : UIView<ButtonClickDelegate>

@property (readonly, retain, nonatomic) TransactionLogger* transLogger;

- (id)initWithItems:(NSArray*)itemNames;

@end
