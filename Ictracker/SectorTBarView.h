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

@interface SectorTBarView : UIView<ButtonClickDelegate>

@property (nonatomic, assign)   BOOL isHighlighted;
@property (readonly, nonatomic) ButtonView* mayDayButton;

- (id)initWithPosition:(CGPoint)position;

@end
