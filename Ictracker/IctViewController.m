//
//  IctViewController.m
//  Ictracker
//
//  Created by S. Cook on 1/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "IctViewController.h"
#import "Utils.h"
#import "SectorTBarView.h"

@interface IctViewController ()

@end

@implementation IctViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    NSLog(@"win Height: %f", [Utils windowHeight]);
    
    _menuContainerView = [[MenuContainerView alloc] initWithSectorMenuDelegate:self
                                                          cityUnitMenuDelegate:self
                                                            actionMenuDelegate:self];
    [self.view addSubview:_menuContainerView];
    
	_menuSelectorView = [[MenuSelectorView alloc] initWithFrame:
                         CGRectMake(0,
                                    [Utils millimetersToPixels:13],
                                    [Utils millimetersToPixels:13],
                                    [Utils windowWidth]-[Utils millimetersToPixels:5])
                                                       delegate:_menuContainerView];
    [self.view addSubview:self.menuSelectorView];
    
    SectorTBarView* sect1a = [[SectorTBarView alloc]
                              initWithPosition:CGPointMake([Utils millimetersToPixels:71], [Utils millimetersToPixels:14])
                               delegate:self];
    [self.view addSubview:sect1a];
    SectorTBarView* sect2a = [[SectorTBarView alloc]
                              initWithPosition:CGPointMake([Utils millimetersToPixels:113], [Utils millimetersToPixels:14])
                              delegate:self];
    [self.view addSubview:sect2a];
    SectorTBarView* sect3a = [[SectorTBarView alloc]
                              initWithPosition:CGPointMake([Utils millimetersToPixels:155], [Utils millimetersToPixels:14])
                              delegate:self];
    [self.view addSubview:sect3a];
    
    SectorTBarView* sect1b = [[SectorTBarView alloc]
                              initWithPosition:CGPointMake([Utils millimetersToPixels:71], [Utils millimetersToPixels:56])
                              delegate:self];
    [self.view addSubview:sect1b];
    SectorTBarView* sect2b = [[SectorTBarView alloc]
                              initWithPosition:CGPointMake([Utils millimetersToPixels:113], [Utils millimetersToPixels:56])
                              delegate:self];
    [self.view addSubview:sect2b];
    SectorTBarView* sect3b = [[SectorTBarView alloc]
                              initWithPosition:CGPointMake([Utils millimetersToPixels:155], [Utils millimetersToPixels:56])
                              delegate:self];
    [self.view addSubview:sect3b];
    
    SectorTBarView* sect1c = [[SectorTBarView alloc]
                              initWithPosition:CGPointMake([Utils millimetersToPixels:71], [Utils millimetersToPixels:98])
                              delegate:self];
    [self.view addSubview:sect1c];
    SectorTBarView* sect2c = [[SectorTBarView alloc]
                              initWithPosition:CGPointMake([Utils millimetersToPixels:113], [Utils millimetersToPixels:98])
                              delegate:self];
    [self.view addSubview:sect2c];
    SectorTBarView* sect3c = [[SectorTBarView alloc]
                              initWithPosition:CGPointMake([Utils millimetersToPixels:155], [Utils millimetersToPixels:98])
                              delegate:self];
    [self.view addSubview:sect3c];

    
    //Default Sector select
    [sect1a setIsSelected:YES];
    [sect3a setIsRescue];
    [sect3c setIsRehab];
    
    _sectorTBars = [NSArray arrayWithObjects:
                   sect1a,
                   sect1b,
                   sect1c,
                   sect2a,
                   sect2b,
                   sect2c,
                   sect3a,
                   sect3b,
                   sect3c, nil];
}

//*** SectorTBarDelegate
- (void) onSelected:(id)selected
{
    for(SectorTBarView* sector in _sectorTBars) {
        if(sector!=selected) {
            [sector setIsSelected:NO];
        }
    }
}

- (void) onTitleClick:(id)selected
{
    [_menuContainerView showSectors];
}

//*** SectorMEnuDelegate
- (void) onClickSector:(NSString*)sectorTitle
{
//    NSLog(@"sectorTitle:%@", sectorTitle);
    for(SectorTBarView* sector in _sectorTBars) {
        if([sector isSelected]) {
            [sector setTitle:sectorTitle];
        }
    }
}

//*** CityUnitMenuDelegate
- (void) onSelectedUnit:(NSString*)unitName
{
//    NSLog(@"unit:%@", unitName);
    for(SectorTBarView* sector in _sectorTBars) {
        if([sector isSelected]) {
            [sector addUnit:unitName];
        }
    }
}

//*** ActionMenuDelegate
- (void) onClickAction:(NSString*)actionTitle
{
    for(SectorTBarView* sector in _sectorTBars) {
        if([sector isSelected]) {
            [sector addAction:actionTitle];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
