//
//  Picker.h
//  Ictracker
//
//  Created by S. Cook on 2/8/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonView.h"
#import "ButtonClickDelegate.h"
#import "PickerDelegate.h"

@interface Picker : UIView<ButtonClickDelegate, UIPickerViewDelegate>

@property (readonly, nonatomic, retain)     ButtonView* myButton;
@property (readonly, retain, nonatomic)     UIPickerView* picker;
@property (readonly, retain, nonatomic)     NSArray* itemStrings;
@property (readonly, retain, nonatomic)     id<PickerDelegate> delegate;

- (id)initWithItems:(NSArray*)itemNames
         buttonSize:(ButtonSize)size
           initText:(NSString*)text
           delegate:(id<PickerDelegate>)delegate;

-(void) setItemColors:(NSArray*)itemColors_;

@end
