//
//  UnitDialog.m
//  Ictracker
//
//  Created by S. Cook on 2/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "UnitDialog.h"
#import "Utils.h"
#import "UnitMenu.h"

@implementation UnitDialog

- (id)initWithDelegate:(id<UnitDialogDelegate>)delegate
{
    CGRect frame = CGRectMake(0, 0, [Utils windowHeight], [Utils windowWidth]);
    self = [super initWithFrame:frame];
    if (self) {
        _delegate = delegate;
        self.backgroundColor = [UIColor clearColor];
        
        _windowCancelButton = [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_BLANK_WINDOW];
        [_windowCancelButton setPosition:CGPointMake(0.0,0.0)];
        
        CGSize size = CGSizeMake([Utils millimetersToPixels:108.5], [Utils millimetersToPixels:60.5]);
        UIView* dialogBg = [[UIView alloc] initWithFrame:CGRectMake(
                                                                    [Utils windowHeight]/2-size.width/2,
                                                                    [Utils windowWidth]/2-size.height/2,
                                                                    size.width,
                                                                    size.height)];
        dialogBg.backgroundColor = [UIColor lightGrayColor];
        dialogBg.layer.borderColor = [UIColor darkGrayColor].CGColor;
        dialogBg.layer.borderWidth = 3.0;
        dialogBg.layer.cornerRadius = 5.0;
        
        [self addSubview:_windowCancelButton];
        [self addSubview:dialogBg];
        
        UnitMenu* unitMenu = [[UnitMenu alloc] initWithFrame:frame cityUnitMenuDelegate:self];
        [unitMenu setMyFrame:dialogBg.frame];
        [self addSubview:unitMenu];
    }
    return self;
}

- (void) setSelectedUnit:(NSString *)unit {
    
}


//*** ButtonClickDelegate ***
- (void) click:(id)selector {
    self.hidden = YES;
    if (_windowCancelButton==selector){
        [_delegate cancelUnitDialog];
    }
}


//*** CityUnitMenuDelegate ***
- (void) onSelectedUnit:(NSString*)unitName {
    
}


@end


