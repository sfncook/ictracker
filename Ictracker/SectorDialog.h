//
//  SectorDialog.h
//  Ictracker
//
//  Created by S. Cook on 2/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonView.h"
#import "ButtonClickDelegate.h"
#import "SectorDialogDelegate.h"

@interface SectorDialog : UIView<ButtonClickDelegate>

@property (readonly, retain, nonatomic) ButtonView* windowCancelButton;
@property (readonly, retain, nonatomic) id<SectorDialogDelegate> delegate;

- (id)initWithDelegate:(id<SectorDialogDelegate>)delegate;
- (void) setSelectedSector:(NSString*)sector;

@end
