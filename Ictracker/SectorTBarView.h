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
#import "TransactionLogger.h"

@interface SectorTBarView : UIView<ButtonClickDelegate>

@property (nonatomic, assign)   BOOL isSelected;
@property (nonatomic, assign)   BOOL isRehab;
@property (nonatomic, assign)   BOOL isRescue;
@property (readonly, retain, nonatomic) ButtonView* mayDayButton;
@property (readonly, retain, nonatomic) id<SectorTBarDelegate> sectorTbarDelegate;
@property (readonly, retain, nonatomic) ButtonView* titleButton;
@property (readonly, retain, nonatomic) ButtonView* psiButton;
@property (readonly, retain, nonatomic) ButtonView* acctButton;

@property (readonly, retain, nonatomic) NSArray* actionButtons;
@property (nonatomic, assign) int manyActions;

@property (readonly, retain, nonatomic) NSArray* parButtons;
@property (readonly, retain, nonatomic) NSArray* unitButtons;
@property (nonatomic, assign) int manyUnits;

@property (nonatomic, assign)   int curActionItemIndex;
@property (readonly, retain, nonatomic) TransactionLogger* transLogger;

- (id)initWithPosition:(CGPoint)position delegate:(id<SectorTBarDelegate>)sectorTbarDelegate_;
- (void) setTitle:(NSString*)title;
- (void) addUnit:(NSString*)unitName;
- (void) addAction:(NSString*)acctUnitName;
- (void) setIsRescue;
- (void) setIsRehab;
- (void) setPsi:(NSString*)psi;

@end
