//
//  IctViewController.m
//  Ictracker
//
//  Created by S. Cook on 1/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "IctViewController.h"

@interface IctViewController ()

@end

@implementation IctViewController

@synthesize menuSelectorView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.menuSelectorView = [[MenuSelectorView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    [self.view addSubview:self.menuSelectorView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
