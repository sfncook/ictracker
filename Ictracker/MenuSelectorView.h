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
#import "ShowMenuDelegate.h"

@interface MenuSelectorView : UIView<ButtonClickDelegate, ShowMenuDelegate>

@property (readonly, nonatomic) ButtonView* unitsButton;
@property (readonly, nonatomic) ButtonView* sectorsButton;
@property (readonly, nonatomic) ButtonView* actionsButton;
@property (readonly, nonatomic) ButtonView* benchmarksButton;
@property (readonly, nonatomic) ButtonView* objectivesButton;
@property (readonly, nonatomic) ButtonView* osrButton;
@property (readonly, nonatomic) ButtonView* notesButton;

@property (readonly, nonatomic) id<MenuSelectorDelegate> selectorDelegate;

- (id)initWithFrame:(CGRect)frame delegate:(id<MenuSelectorDelegate>)selectorDelegate_;

@end
