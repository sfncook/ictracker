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
                                          delegate:sectorTbarDelegate];
                [self addSubview:tBar];
                [tmpRowArray addObject:tBar];
                x += 42;
            }
            [tmpColArray addObject:tmpRowArray];
            x = orig_x;
            y += 42;
        }
        
        _sectorTBars = [NSArray arrayWithArray:tmpColArray];
        
        SectorTBarView* rescueTBar = [self getTbarAtCol:2 row:0];
        [rescueTBar setIsRescue];
        
        SectorTBarView* rehabTBar = [self getTbarAtCol:2 row:2];
        [rehabTBar setIsRehab];
        
//
//        
//        //Default Sector select
//        [sect1a setIsSelected:YES];
//        [sect3a setIsRescue];
//        [sect3c setIsRehab];
//        
//        _sectorTBars = [NSArray arrayWithObjects:
//                        sect1a,
//                        sect1b,
//                        sect1c,
//                        sect2a,
//                        sect2b,
//                        sect2c,
//                        sect3a,
//                        sect3b,
//                        sect3c, nil];

    }
    return self;
}

// col and row are zero-based index.  Upper-left is 0,0 and
//  lower-right is 3,3.  Upper-right is 2,0
- (SectorTBarView*) getTbarAtCol:(int)col row:(int)row {
    NSArray* rows = [_sectorTBars objectAtIndex:row];
    SectorTBarView* tBar = [rows objectAtIndex:col];
    return tBar;
}

@end
