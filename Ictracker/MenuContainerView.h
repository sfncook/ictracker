//
//  MenuContainerView.h
//  Ictracker
//
//  Created by S. Cook on 1/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UnitMenu.h"
#import "SectorMenu.h"

@interface MenuContainerView : UIView

@property (readonly, nonatomic) UnitMenu* unitMenu;
@property (readonly, nonatomic) SectorMenu* sectorMenu;

@end
