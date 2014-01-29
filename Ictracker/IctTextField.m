//
//  IctTextField.m
//  Ictracker
//
//  Created by S. Cook on 1/28/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "IctTextField.h"
#import "Utils.h"

@implementation IctTextField

- (id)initWithPlaceholder:(NSString*)placeholder size:(TextFieldSize)size
{
    float width;
    float height = [Utils millimetersToPixels:10];
    if(size==TEXT_FIELD_LARGE) {
        width = [Utils millimetersToPixels:175];
    }
    if (size==TEXT_FIELD_MEDIUM) {
        width = [Utils millimetersToPixels:100];
    }
    CGRect frame = CGRectMake(0, 0, width, height);
    self = [super initWithFrame:frame];
    if (self) {
        _size = size;
        self.borderStyle = UITextBorderStyleRoundedRect;
        self.font = [UIFont systemFontOfSize:30];
        self.placeholder = placeholder;
        self.autocorrectionType = UITextAutocorrectionTypeNo;
        self.keyboardType = UIKeyboardTypeDefault;
        self.returnKeyType = UIReturnKeyDone;
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    }
    return self;
}

- (void) setPosition:(CGPoint)position
{
    self.frame = CGRectMake(position.x, position.y, self.frame.size.width, self.frame.size.height);
}


@end
