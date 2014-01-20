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

@property (readonly, nonatomic) ButtonView* par1;
@property (readonly, nonatomic) ButtonView* par2;
@property (readonly, nonatomic) ButtonView* par3;
@property (readonly, nonatomic) ButtonView* par4;
@property (readonly, nonatomic) ButtonView* par5;

@property (readonly, nonatomic) ButtonView* unit1;
@property (readonly, nonatomic) ButtonView* unit2;
@property (readonly, nonatomic) ButtonView* unit3;
@property (readonly, nonatomic) ButtonView* unit4;
@property (readonly, nonatomic) ButtonView* unit5;
@property (nonatomic, assign) int manyUnits;

@property (nonatomic, assign)   int curActionItemIndex;

- (id)initWithPosition:(CGPoint)position delegate:(id<SectorTBarDelegate>)sectorTbarDelegate_;
- (void) setTitle:(NSString*)title;
- (void) addUnit:(NSString*)unitName;
- (void) addAction:(NSString*)acctUnitName;
- (void) setIsRescue;
- (void) setIsRehab;

@end
