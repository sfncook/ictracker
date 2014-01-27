//
//  SplashView.m
//  Ictracker
//
//  Created by S. Cook on 1/26/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "SplashView.h"
#import "Utils.h"

@implementation SplashView

- (id)init
{
    CGRect frame = CGRectMake(0, 0, [Utils windowHeight], [Utils windowWidth]);
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 5.0;
        self.layer.masksToBounds = YES;
        self.layer.borderColor = [UIColor blueColor].CGColor;
        
        UIImageView* logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ictlogo_large"]];
        [logo setFrame:CGRectMake(
                                  400,
                                  40,
                                  200,
                                  200)];
        
        UILabel* title = [[UILabel alloc] init];
        [title setText:@"Incident Command Tracker"];
        [title setFont:[UIFont fontWithName:@"Arial" size:50]];
        [title setFrame:CGRectMake(230, logo.frame.origin.y+logo.frame.size.height, 1000, 100)];
        
        UILabel* copyright = [[UILabel alloc] init];
        [copyright setText:@"Copyright 2014 Shawn Cook & Jeff Cross"];
        [copyright setFont:[UIFont fontWithName:@"Arial" size:18]];
        [copyright setFrame:CGRectMake([Utils windowHeight]-380, [Utils windowWidth]-100, 1000, 100)];
        
        UILabel* license = [[UILabel alloc] init];
        [license setText:@"Licensed to XXX Fire Department - 2014"];
        [license setFont:[UIFont fontWithName:@"Arial" size:18]];
        [license setFrame:CGRectMake(40, [Utils windowWidth]-100, 1000, 100)];
        
        UIImageView* fireImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fire"]];
        [fireImg setFrame:CGRectMake(
                                  175,
                                  375,
                                  250,
                                  250)];
        fireImg.layer.borderColor = [UIColor blackColor].CGColor;
        fireImg.layer.borderWidth = 3.0;
        fireImg.layer.cornerRadius = 15.0;
        
        UIImageView* emsImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ems"]];
        [emsImg setFrame:CGRectMake(
                                     575,
                                     375,
                                     250,
                                     250)];
        emsImg.layer.borderColor = [UIColor blackColor].CGColor;
        emsImg.layer.borderWidth = 3.0;
        emsImg.layer.cornerRadius = 15.0;
        
        [self addSubview:logo];
        [self addSubview:title];
        [self addSubview:copyright];
        [self addSubview:license];
        [self addSubview:fireImg];
        [self addSubview:emsImg];
    }
    return self;
}


@end



