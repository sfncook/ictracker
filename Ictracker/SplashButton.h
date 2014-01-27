//
//  SplashButton.h
//  Ictracker
//
//  Created by S. Cook on 1/26/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonClickDelegate.h"

@interface SplashButton : UIView

@property (readonly, nonatomic, assign) id<ButtonClickDelegate> delegate;
@property (readonly, nonatomic, retain) UIImageView* imgView;

@end
