//
//  SectorTbarContainerView.h
//  Ictracker
//
//  Created by S. Cook on 1/20/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SectorTBarDelegate.h"

@interface SectorTbarContainerView : UIView

- (id)initWithDelegate:(id<SectorTBarDelegate>)sectorTbarDelegate;

@end
