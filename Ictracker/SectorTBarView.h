//
//  SectorTBarView.h
//  Ictracker
//
//  Created by S. Cook on 1/14/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonClickDelegate.h"
#import "ButtonView.h"
#import "SectorTBarDelegate.h"

@interface SectorTBarView : UIView<ButtonClickDelegate>

@property (nonatomic, assign)   BOOL isSelected;
@property (readonly, nonatomic) ButtonView* mayDayButton;
@property (readonly, nonatomic) id<SectorTBarDelegate> sectorTbarDelegate;

- (id)initWithPosition:(CGPoint)position delegate:(id<SectorTBarDelegate>)sectorTbarDelegate_;

@end
