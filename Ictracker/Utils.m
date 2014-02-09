//
//  Utils.m
//  Ictracker
//
//  Created by S. Cook on 1/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "Utils.h"

@implementation Utils

double PIX_PER_INCH_IPADAIR_RETINA  = 264.0;
double PIX_PER_INCH_IPAD2           = 132.0;
double PIX_PER_INCH_IPADMINI_RETINA = 326.0;
double PIX_PER_INCH_IPADMINI        = 163.0;

//Convert millimeters to pixels based on apple.com iPad specs.
+ (double) millimetersToPixels:(double)mm
{
    double d_inches = mm*0.0393701;
    double d_pixels = d_inches*PIX_PER_INCH_IPAD2;
    //http://www.apple.com/ipad-mini/specs/
//    NSLog(@"mm:%f pix:%f", d_mm, d_pixels);
    return d_pixels;
}

+ (double) windowWidth
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    return screenWidth;
}

+ (double) windowHeight
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenHeight = screenRect.size.height;
    return screenHeight;
}

static UIView* mainView = nil;
+ (void) setMainView:(UIView*)view {
    mainView = view;
}

+ (void) addSubViewToMainView:(UIView*)view {
    [mainView addSubview:view];
}

+ (UIView*) mainView {
    return mainView;
}

+ (void) sendSubviewToBack:(UIView*)view {
    [mainView sendSubviewToBack:view];
}

+ (void) bringSubviewToFront:(UIView*)view {
    [mainView bringSubviewToFront:view];
}

@end
