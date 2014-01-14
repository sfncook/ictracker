//
//  IctViewController.h
//  Ictracker
//
//  Created by S. Cook on 1/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuSelectorView.h"
#import "MenuContainerView.h"

@interface IctViewController : UIViewController

@property (nonatomic, retain) MenuSelectorView* menuSelectorView;
@property (nonatomic, retain) MenuContainerView* menuContainerView;

@end
