//
//  ActionsMenu.h
//  Ictracker
//
//  Created by S. Cook on 1/13/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WideItemsMenuView.h"
#import "ActionMenuDelegate.h"

@interface ActionsMenu : WideItemsMenuView

@property (readonly, nonatomic) id<ActionMenuDelegate>delegate;

- (id)initWithDelegate:(id<ActionMenuDelegate>)delegate;

@end
