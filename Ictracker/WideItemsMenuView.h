//
//  WideItemsMenuView.h
//  Ictracker
//
//  Created by S. Cook on 1/13/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonClickDelegate.h"

@interface WideItemsMenuView : UIView<ButtonClickDelegate>

- (id)initWithItems:(NSArray*)itemNames;

@end

