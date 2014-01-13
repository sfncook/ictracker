//
//  ButtonView.h
//  Ictracker
//
//  Created by S. Cook on 1/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonClickDelegate.h"

typedef enum buttonsize {BUTTON_LARGE, BUTTON_MEDIUM} ButtonSize;

@interface ButtonView : UIView

@property (nonatomic, assign)   ButtonSize size;
@property (nonatomic, retain)      NSString * name;
@property (nonatomic, retain)      id<ButtonClickDelegate> clickDelegate;

- (id)initWithName:(NSString*)name_ delegate:(id<ButtonClickDelegate>)clickDelegate_ size:(ButtonSize)size_;

@end
