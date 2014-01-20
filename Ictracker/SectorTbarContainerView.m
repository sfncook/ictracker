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
        NSMutableArray* tmpArray = [[NSMutableArray alloc] initWithCapacity:9];
        double orig_x = 1;
        double orig_y = 1;
        double x = orig_x;
        double y = orig_y;
        for (int row=0; row<3; row++) {
            for (int col=0; col<3; col++) {
                SectorTBarView* tBar = [[SectorTBarView alloc]
                                          initWithPosition:CGPointMake([Utils millimetersToPixels:x], [Utils millimetersToPixels:y])
                                          delegate:sectorTbarDelegate];
                [self addSubview:tBar];
                [tmpArray addObject:tBar];
                x += 42;
            }
            x = orig_x;
            y += 42;
        }
        
//        SectorTBarView* sect1a = [[SectorTBarView alloc]
//                                  initWithPosition:CGPointMake([Utils millimetersToPixels:71], [Utils millimetersToPixels:14])
//                                  delegate:self];
//        [self.view addSubview:sect1a];
//        SectorTBarView* sect2a = [[SectorTBarView alloc]
//                                  initWithPosition:CGPointMake([Utils millimetersToPixels:113], [Utils millimetersToPixels:14])
//                                  delegate:self];
//        [self.view addSubview:sect2a];
//        SectorTBarView* sect3a = [[SectorTBarView alloc]
//                                  initWithPosition:CGPointMake([Utils millimetersToPixels:155], [Utils millimetersToPixels:14])
//                                  delegate:self];
//        [self.view addSubview:sect3a];
//        
//        SectorTBarView* sect1b = [[SectorTBarView alloc]
//                                  initWithPosition:CGPointMake([Utils millimetersToPixels:71], [Utils millimetersToPixels:56])
//                                  delegate:self];
//        [self.view addSubview:sect1b];
//        SectorTBarView* sect2b = [[SectorTBarView alloc]
//                                  initWithPosition:CGPointMake([Utils millimetersToPixels:113], [Utils millimetersToPixels:56])
//                                  delegate:self];
//        [self.view addSubview:sect2b];
//        SectorTBarView* sect3b = [[SectorTBarView alloc]
//                                  initWithPosition:CGPointMake([Utils millimetersToPixels:155], [Utils millimetersToPixels:56])
//                                  delegate:self];
//        [self.view addSubview:sect3b];
//        
//        SectorTBarView* sect1c = [[SectorTBarView alloc]
//                                  initWithPosition:CGPointMake([Utils millimetersToPixels:71], [Utils millimetersToPixels:98])
//                                  delegate:self];
//        [self.view addSubview:sect1c];
//        SectorTBarView* sect2c = [[SectorTBarView alloc]
//                                  initWithPosition:CGPointMake([Utils millimetersToPixels:113], [Utils millimetersToPixels:98])
//                                  delegate:self];
//        [self.view addSubview:sect2c];
//        SectorTBarView* sect3c = [[SectorTBarView alloc]
//                                  initWithPosition:CGPointMake([Utils millimetersToPixels:155], [Utils millimetersToPixels:98])
//                                  delegate:self];
//        [self.view addSubview:sect3c];
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


@end
