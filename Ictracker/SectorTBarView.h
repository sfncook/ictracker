//
//  SectorTBarView.h
//  Ictracker
//
//  Created by S. Cook on 1/14/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonClickDelegate.h"
#import "ButtonView.h"
#import "SectorTBarDelegate.h"

@interface SectorTBarView : UIView<ButtonClickDelegate>

@property (nonatomic, assign)   BOOL isSelected;
@property (nonatomic, assign)   BOOL isRehab;
@property (nonatomic, assign)   BOOL isRescue;
@property (readonly, nonatomic) ButtonView* mayDayButton;
@property (readonly, nonatomic) id<SectorTBarDelegate> sectorTbarDelegate;
@property (readonly, nonatomic) ButtonView* titleButton;
@property (readonly, nonatomic) ButtonView* psiButton;
@property (readonly, nonatomic) ButtonView* acctButton;

@property (readonly, nonatomic) NSArray* actionButtons;
@property (nonatomic, assign) int manyActions;

@property (readonly, nonatomic) NSArray* parButtons;
@property (readonly, nonatomic) NSArray* unitButtons;
@property (nonatomic, assign) int manyUnits;

@property (nonatomic, assign)   int curActionItemIndex;

- (id)initWithPosition:(CGPoint)position delegate:(id<SectorTBarDelegate>)sectorTbarDelegate_;
- (void) setTitle:(NSString*)title;
- (void) addUnit:(NSString*)unitName;
- (void) addAction:(NSString*)acctUnitName;
- (void) setIsRescue;
- (void) setIsRehab;

@end
