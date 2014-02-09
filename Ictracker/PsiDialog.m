//
//  PsiDialog.m
//  Ictracker
//
//  Created by S. Cook on 2/3/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "PsiDialog.h"
#import "Utils.h"

@implementation PsiDialog

- (id)initWithDelegate:(id<PsiDialogDelegate>)delegate position:(CGPoint)position
{
    CGRect frame = CGRectMake(0, 0, [Utils windowHeight], [Utils windowWidth]);
    self = [super initWithFrame:frame];
    if (self) {
        _delegate = delegate;
        self.backgroundColor = [UIColor clearColor];
        
        _windowCancelButton = [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_BLANK_WINDOW];
        [_windowCancelButton setPosition:CGPointMake(0.0,0.0)];
        [self addSubview:_windowCancelButton];

        NSMutableArray* psiValuesTmp = [[NSMutableArray alloc] init];
        for (int psi=4500; psi>=0; psi-=100) {
            [psiValuesTmp addObject:[NSNumber numberWithInt:psi]];
        }//for
        _psiValues = [[NSArray alloc] initWithArray:psiValuesTmp];
        
        _picker = [[UIPickerView alloc] initWithFrame:CGRectMake(position.x, position.y, [Utils millimetersToPixels:7], 100)];
        _picker.delegate = self;
        _picker.showsSelectionIndicator = NO;
//        _picker.backgroundColor = [UIColor blueColor];
        [self addSubview:_picker];
    }
    return self;
}

- (void) setSelectedPsi:(NSString*)psi {
    if (psi.length==0) {
        return;
    }
    
    for (NSNumber* psiNum in _psiValues) {
        if ([psi isEqualToString:psiNum.stringValue]) {
            [_picker selectRow:[_psiValues indexOfObject:psiNum] inComponent:0 animated:NO];
            return;
        }
    }
}

//*** ButtonClickDelegate ***
- (void) click:(id)selector {
    self.hidden = YES;
    if (_windowCancelButton==selector){
        [_delegate cancel];
    }
}


//*** UIPickerViewDelegate ***

- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
    NSNumber* psiNum = [_psiValues objectAtIndex:row];
    [_delegate selectPsi:psiNum.stringValue];
}

// tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _psiValues.count;
}

// tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    NSNumber* psiNum = [_psiValues objectAtIndex:row];
    int psi = [psiNum intValue];
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [Utils millimetersToPixels:7], [Utils millimetersToPixels:5])];
    [label setText:psiNum.stringValue];
    label.font = [UIFont fontWithName:@"Arial" size:14];
    if (psi<1500) {
        [label setBackgroundColor:[UIColor redColor]];
    } else if (psi<3000) {
        [label setBackgroundColor:[UIColor yellowColor]];
    } else {
        [label setBackgroundColor:[UIColor greenColor]];
    }
    
    return label;
}

- (void) setPosition:(CGPoint)position {
    self.frame = CGRectMake(position.x, position.y, self.frame.size.width, self.frame.size.height);
}

// tell the picker the width of each row for a given component
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return [Utils millimetersToPixels:7];
}

@end
