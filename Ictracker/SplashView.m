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

- (id)initWithDelegate:(id<SplashDelegate>)delegate
{
    CGRect frame = CGRectMake(0, 0, [Utils windowHeight], [Utils windowWidth]);
    self = [super initWithFrame:frame];
    if (self) {
        _delegate = delegate;
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
        
        _fireBtn = [[ImgButton alloc] initWithImage:@"fire" delegate:self size:IMG_BUTTON_LARGE];
        [_fireBtn setPosition:CGPointMake(175, 375)];
        
        _emsBtn = [[ImgButton alloc] initWithImage:@"ems" delegate:self size:IMG_BUTTON_LARGE];
        [_emsBtn setPosition:CGPointMake(575, 375)];
        
        [self addSubview:logo];
        [self addSubview:title];
        [self addSubview:copyright];
        [self addSubview:license];
        [self addSubview:_fireBtn];
        [self addSubview:_emsBtn];
    }
    return self;
}

- (void) click:(id)selector {
    if(_fireBtn==selector) {
        [_delegate clickFire];
    } else if(_emsBtn==selector) {
        
    }
}

@end



