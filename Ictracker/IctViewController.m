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
    
    _menuContainerView = [[MenuContainerView alloc] init];
    [self.view addSubview:_menuContainerView];
    
	_menuSelectorView = [[MenuSelectorView alloc] initWithFrame:
                         CGRectMake(0,
                                    [Utils millimetersToPixels:13],
                                    [Utils millimetersToPixels:13],
                                    [Utils windowWidth]-[Utils millimetersToPixels:5])
                                                       delegate:_menuContainerView];
    [self.view addSubview:self.menuSelectorView];
    
    SectorTBarView* sect1a = [[SectorTBarView alloc] initWithPosition:CGPointMake([Utils millimetersToPixels:71], [Utils millimetersToPixels:14])];
    [self.view addSubview:sect1a];
    SectorTBarView* sect2a = [[SectorTBarView alloc] initWithPosition:CGPointMake([Utils millimetersToPixels:113], [Utils millimetersToPixels:14])];
    [self.view addSubview:sect2a];
    SectorTBarView* sect3a = [[SectorTBarView alloc] initWithPosition:CGPointMake([Utils millimetersToPixels:155], [Utils millimetersToPixels:14])];
    [self.view addSubview:sect3a];
    
    SectorTBarView* sect1b = [[SectorTBarView alloc] initWithPosition:CGPointMake([Utils millimetersToPixels:71], [Utils millimetersToPixels:56])];
    [self.view addSubview:sect1b];
    SectorTBarView* sect2b = [[SectorTBarView alloc] initWithPosition:CGPointMake([Utils millimetersToPixels:113], [Utils millimetersToPixels:56])];
    [self.view addSubview:sect2b];
    SectorTBarView* sect3b = [[SectorTBarView alloc] initWithPosition:CGPointMake([Utils millimetersToPixels:155], [Utils millimetersToPixels:56])];
    [self.view addSubview:sect3b];
    
    SectorTBarView* sect1c = [[SectorTBarView alloc] initWithPosition:CGPointMake([Utils millimetersToPixels:71], [Utils millimetersToPixels:98])];
    [self.view addSubview:sect1c];
    SectorTBarView* sect2c = [[SectorTBarView alloc] initWithPosition:CGPointMake([Utils millimetersToPixels:113], [Utils millimetersToPixels:98])];
    [self.view addSubview:sect2c];
    SectorTBarView* sect3c = [[SectorTBarView alloc] initWithPosition:CGPointMake([Utils millimetersToPixels:155], [Utils millimetersToPixels:98])];
    [self.view addSubview:sect3c];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
