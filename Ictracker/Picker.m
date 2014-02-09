//
//  Picker.m
//  Ictracker
//
//  Created by S. Cook on 2/8/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "Picker.h"
#import "Utils.h"

@implementation Picker

NSArray* itemColors = nil;

- (id)initWithItems:(NSArray*)itemNames
         buttonSize:(ButtonSize)size
           initText:(NSString*)text
           delegate:(id<PickerDelegate>)delegate {
    
    CGRect frame = CGRectMake(0, 0, [Utils windowHeight], [Utils windowWidth]);
    self = [super initWithFrame:frame];
    if (self) {
        _windowCancelButton = [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_BLANK_WINDOW];
        [_windowCancelButton setPosition:CGPointMake(0.0,0.0)];
        _windowCancelButton.hidden = YES;
        _windowCancelButton.backgroundColor = [UIColor blueColor];

        _myButton = [[ButtonView alloc] initWithName:text delegate:self size:size];
        _itemStrings = [[NSArray alloc] initWithArray:itemNames];
        _delegate = delegate;
        
        _picker = [[UIPickerView alloc] initWithFrame:CGRectMake(
                                                                 0,
                                                                 0,
                                                                 [Utils millimetersToPixels:7],
                                                                 [Utils millimetersToPixels:5])];
        _picker.delegate = self;
        _picker.showsSelectionIndicator = NO;
        _picker.hidden = YES;
        _picker.backgroundColor=[UIColor blueColor];

        [Utils addSubViewToMainView:_windowCancelButton];
        [self addSubview:_picker];
        [self addSubview:_myButton];
    }
    return self;
}

-(void) setItemColors:(NSArray*)itemColors_ {
    itemColors = [[NSArray alloc] initWithArray:itemColors_];
}

- (void) setPosition:(CGPoint)position {
    [_myButton setPosition:position];
    _picker.frame = CGRectMake(position.x,
                               (position.y-_picker.frame.size.height/2)+10,
                               _picker.frame.size.width, _picker.frame.size.height);
    [[Utils mainView] bringSubviewToFront:self];
}

//*** ButtonClickDelegate ***
- (void) click:(id)selector {
    if (_myButton==selector) {
        //Hide button and show picker
        _myButton.hidden = YES;
        _windowCancelButton.hidden = NO;
        _picker.hidden = NO;
        [Utils bringSubviewToFront:_windowCancelButton];
        [Utils bringSubviewToFront:_picker];
    }
    if (_windowCancelButton==selector) {
        _myButton.hidden = NO;
        _windowCancelButton.hidden = YES;
        _picker.hidden = YES;
        [_delegate cancelPicker];
    }
}


//*** UIPickerViewDelegate ***
- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
    NSString* itemStr = [_itemStrings objectAtIndex:row];
    [_myButton setName:itemStr];
    [_delegate selectItem:itemStr picker:self];
    _myButton.hidden = NO;
    _windowCancelButton.hidden = YES;
    _picker.hidden = YES;
}

// tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _itemStrings.count;
}

// tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    NSString* itemStr = [_itemStrings objectAtIndex:row];
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _myButton.frame.size.width, _myButton.frame.size.height)];
    [label setText:itemStr];
    label.font = [UIFont fontWithName:@"Arial" size:14];
    if (itemColors!=nil) {
        label.backgroundColor = [itemColors objectAtIndex:row];
    }
    return label;
}

@end
