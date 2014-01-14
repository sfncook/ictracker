//
//  IctViewController.m
//  Ictracker
//
//  Created by S. Cook on 1/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "IctViewController.h"
#import "Utils.h"

@interface IctViewController ()

@end

@implementation IctViewController

@synthesize menuSelectorView;
@synthesize menuContainerView;

- (void)viewDidLoad
{
    [super viewDidLoad];
//    NSLog(@"win Height: %f", [Utils windowHeight]);
	self.menuSelectorView = [[MenuSelectorView alloc] initWithFrame:CGRectMake(0, [Utils millimetersToPixels:5], [Utils millimetersToPixels:13], [Utils windowWidth]-[Utils millimetersToPixels:5])];
    [self.view addSubview:self.menuSelectorView];
    
    self.menuContainerView = [[MenuContainerView alloc] init];
    [self.view addSubview:self.menuContainerView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
