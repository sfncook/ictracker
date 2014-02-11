//
//  SectorTbarContainerView.m
//  Ictracker
//
//  Created by S. Cook on 1/20/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "SectorTbarContainerView.h"
#import "Utils.h"
#import "SectorTBarView.h"
#import "ButtonView.h"

@implementation SectorTbarContainerView

- (id)initWithDelegate:(id<SectorTBarDelegate>)sectorTbarDelegate
{
    CGRect frame = CGRectMake(
                              [Utils millimetersToPixels:70],
                              [Utils millimetersToPixels:13],
                              [Utils millimetersToPixels:126],
                              [Utils millimetersToPixels:126]);
    self = [super initWithFrame:frame];
    if (self) {
        
        //Construct Sector T-Bars
        double orig_x = 1;
        double orig_y = 1;
        double x = orig_x;
        double y = orig_y;
        NSMutableArray* tmpColArray = [[NSMutableArray alloc] initWithCapacity:3];
        for (int row=0; row<3; row++) {
            NSMutableArray* tmpRowArray = [[NSMutableArray alloc] initWithCapacity:3];
            for (int col=0; col<3; col++) {
                SectorTBarView* tBar = [[SectorTBarView alloc]
                                          initWithPosition:CGPointMake([Utils millimetersToPixels:x], [Utils millimetersToPixels:y])
                                          delegate:self];
                [self addSubview:tBar];
                [tmpRowArray addObject:tBar];
                x += 42;
            }
            [tmpColArray addObject:tmpRowArray];
            x = orig_x;
            y += 42;
        }
        
        _sectorTbarDelegate = sectorTbarDelegate;
        
        _sectorTBars = [NSArray arrayWithArray:tmpColArray];
        
        SectorTBarView* defaultTBar = [self getTbarAtCol:0 row:0];
        [defaultTBar setIsSelected:YES];
        
        SectorTBarView* rescueTBar = [self getTbarAtCol:2 row:0];
        [rescueTBar setIsRescue];
        
        SectorTBarView* rehabTBar = [self getTbarAtCol:2 row:2];
        [rehabTBar setIsRehab];

    }
    return self;
}

//*** SectorTBarDelegate
- (void) onSelected:(id)selected
{
    [self resetTBarSelection];
    SectorTBarView* tBar = selected;
    [tBar setIsSelected:YES];
}
- (void) onTitleClick:(id)selected
{
    [_sectorTbarDelegate onTitleClick:selected];
}
- (void) onActionClick:(id)selected
{
    [_sectorTbarDelegate onActionClick:selected];
}
- (void) onUnitClick:(id)selected
{
    [_sectorTbarDelegate onUnitClick:selected];
}
- (void) onActionableUnitClick:(id)selected
{
    [_sectorTbarDelegate onActionableUnitClick:selected];
}
- (void) onPsiClickWithSectorTBar:(id)sectorTBarView
{
    //pass the buck
    [_sectorTbarDelegate onPsiClickWithSectorTBar:sectorTBarView];
}
- (void) onParClickWithSectorTBar:(id)sectorTBarView partButton:(ButtonView*)parButton
{
    //pass the buck
    [_sectorTbarDelegate onParClickWithSectorTBar:sectorTBarView partButton:parButton];
}


//*** SectorMenuDelegate
- (void) onClickSector:(NSString*)sectorTitle
{
    for(NSArray* rows in _sectorTBars) {
        for(SectorTBarView* tBar in rows) {
            if([tBar isSelected]) {
                [tBar setTitle:sectorTitle];
            }
        }
    }
}

//*** CityUnitMenuDelegate
- (void) onSelectedUnit:(NSString*)unitName
{
    for(NSArray* rows in _sectorTBars) {
        for(SectorTBarView* tBar in rows) {
            if([tBar isSelected]) {
                [tBar addUnit:unitName];
            }
        }
    }
}

//*** ActionMenuDelegate
- (void) onClickAction:(NSString*)actionTitle
{
    for(NSArray* rows in _sectorTBars) {
        for(SectorTBarView* tBar in rows) {
            if([tBar isSelected]) {
                [tBar addAction:actionTitle];
            }
        }
    }
}

- (void) resetTBarSelection {
    for(NSArray* rows in _sectorTBars) {
        for(SectorTBarView* tBar in rows) {
            [tBar setIsSelected:NO];
        }
    }
}

// col and row are zero-based index.  Upper-left is 0,0 and
//  lower-right is 3,3.  Upper-right is 2,0
- (SectorTBarView*) getTbarAtCol:(int)col row:(int)row {
    NSArray* rows = [_sectorTBars objectAtIndex:row];
    SectorTBarView* tBar = [rows objectAtIndex:col];
    return tBar;
}

@end
