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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _splashView = [[SplashView alloc] initWithDelegate:self];
    _fireView = [[FireView alloc] init];
    _fireView.hidden = YES;
    
    [self.view addSubview:_splashView];
    [self.view addSubview:_fireView];
    
}

-(void) clickFire {
    _splashView.hidden = YES;
    _fireView.hidden = NO;
}

-(void) clickEms {
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end


