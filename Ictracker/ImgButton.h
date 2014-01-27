//
//  SplashButton.h
//  Ictracker
//
//  Created by S. Cook on 1/26/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonClickDelegate.h"

typedef enum imgbuttonsize {
    IMG_BUTTON_LARGE,
    IMG_BUTTON_MEDIUM
} ImgButtonSize;

@interface ImgButton : UIView

@property (readonly, nonatomic, retain) id<ButtonClickDelegate> delegate;
@property (readonly, nonatomic, retain) UIImageView* imgView;
@property (readonly, nonatomic, assign) ImgButtonSize size;

- (id)initWithImage:(NSString*)imageName delegate:(id<ButtonClickDelegate>)delegate size:(ImgButtonSize)size;
- (void) setPosition:(CGPoint)position;

@end
