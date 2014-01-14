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

@interface MenuSelectorView : UIView<ButtonClickDelegate>

@property (readonly, nonatomic) ButtonView* unitsButton;

@end
