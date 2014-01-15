//
//  SectorMenu.h
//  Ictracker
//
//  Created by S. Cook on 1/13/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WideItemsMenuView.h"
#import "SectorMenuDelegate.h"

@interface SectorMenu : WideItemsMenuView

@property (readonly, nonatomic) id<SectorMenuDelegate>menuDelegate;

- (id)initWithDelegate:(id<SectorMenuDelegate>)menuDelegate;

@end
