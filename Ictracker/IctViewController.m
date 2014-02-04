//
//  IctViewController.m
//  Ictracker
//
//  Created by S. Cook on 1/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "IctViewController.h"
#import "Incident.h"
#import "ReportFormatter.h"

@interface IctViewController ()

@end

@implementation IctViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _splashView = [[SplashView alloc] initWithDelegate:self];
    _fireView = [[FireView alloc] initWithSplashDelegate:self];
    _fireView.hidden = YES;
    
    _pdfView = [[PdfView alloc] initWithDelegate:self];
    _pdfView.hidden = YES;
    
    [self.view addSubview:_splashView];
    [self.view addSubview:_fireView];
    [self.view addSubview:_pdfView];
    
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

-(void)showSplash {
    _splashView.hidden = NO;
    _fireView.hidden = YES;
}

-(void) showFire {
    _splashView.hidden = YES;
    _fireView.hidden = NO;
}

-(void) showEms {
    
}

-(void) openReportWithIncident:(Incident*)incident {
    ReportFormatter* reportFmtr = [[ReportFormatter alloc]init];
    NSString* title = @"City of Mesa Fire Department\nFire Incident Command Tracker - Report Log";
    NSString* pdfFile = [reportFmtr generatePdfWithTxLogger:[TransactionLogger transLogger]
                                                          address:incident.address
                                                       incidentId:incident.incidentId
                                                            title:title];
    
    [_pdfView openWithPdfFile:pdfFile address:incident.address incidentId:incident.incidentId];
    [self.view bringSubviewToFront:_pdfView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end


