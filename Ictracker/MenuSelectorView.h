//
//  MenuSelectorView.h
//  Ictracker
//
//  Created by S. Cook on 1/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonView.h"
#import "ButtonClickDelegate.h"
#import "MenuSelectorDelegate.h"

@interface MenuSelectorView : UIView<ButtonClickDelegate>

@property (readonly, nonatomic) ButtonView* unitsButton;
@property (readonly, nonatomic) ButtonView* sectorsButton;
@property (readonly, nonatomic) id<MenuSelectorDelegate> selectorDelegate;

- (id)initWithFrame:(CGRect)frame delegate:(id<MenuSelectorDelegate>)selectorDelegate_;

@end
