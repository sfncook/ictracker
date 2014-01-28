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
    _fireView = [[FireView alloc] initWithMailDelegate:self];
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

- (void) showmailDialog:(MFMailComposeViewController*)mailCtl {
    mailCtl.mailComposeDelegate = self;
    [self presentViewController:mailCtl animated:YES completion:nil];
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    // Notifies users about errors associated with the interface
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Result: canceled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Result: saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Result: sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Result: failed");
            break;
        default:
            NSLog(@"Result: not sent");
            break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end


