//
//  SplashView.h
//  Ictracker
//
//  Created by S. Cook on 1/26/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SplashButton.h"
#import "ButtonClickDelegate.h"
#import "SplashDelegate.h"

@interface SplashView : UIView<ButtonClickDelegate>

@property (readonly, nonatomic, retain) SplashButton* fireBtn;
@property (readonly, nonatomic, retain) SplashButton* emsBtn;
@property (readonly, nonatomic, retain) id<SplashDelegate> delegate;

- (id)initWithDelegate:(id<SplashDelegate>)delegate;

@end
