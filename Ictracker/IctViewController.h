//
//  IctViewController.h
//  Ictracker
//
//  Created by S. Cook on 1/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SplashView.h"
#import "FireView.h"
#import "SplashDelegate.h"
#import "ShowMailDialogDelegate.h"

@interface IctViewController : UIViewController<SplashDelegate, ShowMailDialogDelegate, MFMailComposeViewControllerDelegate>

@property (readonly, retain, nonatomic) SplashView* splashView;
@property (readonly, retain, nonatomic) FireView* fireView;

@end
