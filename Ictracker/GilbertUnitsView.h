//
//  GilbertUnitsView.h
//  Ictracker
//
//  Created by S. Cook on 1/13/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CityUnitsView.h"

@interface GilbertUnitsView : CityUnitsView

- (id)initWithFrame:(CGRect)frame delegate:(id<CityUnitMenuDelegate>)cityUnitMenuDelegate;

@end
