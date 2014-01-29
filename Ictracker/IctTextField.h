//
//  IctTextField.h
//  Ictracker
//
//  Created by S. Cook on 1/28/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum textFieldSize {
    TEXT_FIELD_LARGE,
    TEXT_FIELD_MEDIUM,} TextFieldSize;

@interface IctTextField : UITextField

@property (readonly, assign)    TextFieldSize size;

- (id)initWithPlaceholder:(NSString*)placeholder size:(TextFieldSize)size;
- (void) setPosition:(CGPoint)position;

@end
