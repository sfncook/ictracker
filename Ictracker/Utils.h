//
//  Utils.h
//  Ictracker
//
//  Created by S. Cook on 1/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

+ (double) millimetersToPixels:(double)mm;
+ (double) windowWidth;
+ (double) windowHeight;
+ (void) setMainView:(UIView*)view;
+ (void) addSubViewToMainView:(UIView*)view;
+ (UIView*) mainView;
+ (void) sendSubviewToBack:(UIView*)view;
+ (void) bringSubviewToFront:(UIView*)view;

@end
