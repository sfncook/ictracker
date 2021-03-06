//
//  ButtonView.h
//  Ictracker
//
//  Created by S. Cook on 1/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonClickDelegate.h"

typedef enum buttonsize {
    BUTTON_HEADER,
    BUTTON_LARGE,
    BUTTON_MEDIUM,
    BUTTON_SMALL,
    BUTTON_WIDE,
    BUTTON_WIDE_LG,
    CHECK_WIDE,
    SMALL_SQUARE,
    SMALL_CIRCLE,
    BUTTON_UNIT,
    BUTTON_DDLB,
    BUTTON_BLANK_WINDOW} ButtonSize;

@interface ButtonView : UIView

@property (nonatomic, assign)       BOOL isHighlighted;
@property (nonatomic, assign)       BOOL isChecked;
@property (readonly, assign)        ButtonSize size;
@property (retain, nonatomic)       NSString * name;
@property (readonly, nonatomic)     id<ButtonClickDelegate> clickDelegate;
@property (retain, nonatomic)       UIColor * normalColor;
@property (retain, nonatomic)       UIColor * downColor;
@property (retain, nonatomic)       UIColor * borderColor;
@property (retain, nonatomic)       UIColor * fontColor;
@property (readonly, nonatomic, retain)        UIColor* defaultNormalColor;
@property (readonly, nonatomic, retain)        UIColor* defaultDownColor;
@property (readonly, nonatomic, retain)        UIColor* defaultBorderColor;

- (id)initWithName:(NSString*)name_ delegate:(id<ButtonClickDelegate>)clickDelegate_ size:(ButtonSize)size_;
- (void) setPosition:(CGPoint)position;

@end
