//
//  SectorTbarContainerView.h
//  Ictracker
//
//  Created by S. Cook on 1/20/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SectorTBarDelegate.h"
#import "SectorMenuDelegate.h"
#import "CityUnitMenuDelegate.h"
#import "ActionMenuDelegate.h"

@interface SectorTbarContainerView : UIView<SectorTBarDelegate, SectorMenuDelegate, CityUnitMenuDelegate, ActionMenuDelegate>

@property (readonly, nonatomic) NSArray* sectorTBars;
@property (readonly, nonatomic) id<SectorTBarDelegate> sectorTbarDelegate;

- (id)initWithDelegate:(id<SectorTBarDelegate>)sectorTbarDelegate;

@end
