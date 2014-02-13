//
//  UnitDialog.h
//  Ictracker
//
//  Created by S. Cook on 2/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonView.h"
#import "ButtonClickDelegate.h"
#import "UnitDialogDelegate.h"
#import "CityUnitMenuDelegate.h"

@interface UnitDialog : UIView<ButtonClickDelegate, CityUnitMenuDelegate>

@property (readonly, retain, nonatomic) ButtonView* windowCancelButton;
@property (readonly, retain, nonatomic) id<UnitDialogDelegate> delegate;

- (id)initWithDelegate:(id<UnitDialogDelegate>)delegate;
- (void) setSelectedUnit:(NSString*)unit;


@end
