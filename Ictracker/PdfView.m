//
//  PdfView.m
//  Ictracker
//
//  Created by S. Cook on 1/27/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "PdfView.h"
#import "Utils.h"
#import <MessageUI/MFMailComposeViewController.h>

@implementation PdfView

- (id)initWithDelegate:(id<ShowMailDialogDelegate>)delegate
{
    self = [super initWithFrame:CGRectMake(0, 0, [Utils windowHeight], [Utils windowWidth])];
    if (self) {
        _delegate = delegate;
        _webView=[[UIWebView alloc] initWithFrame:self.frame];
        _webView.scalesPageToFit = YES;
        
        _closeButton = [[ImgButton alloc] initWithImage:@"close" delegate:self size:IMG_BUTTON_SMALL];
        [_closeButton setPosition:CGPointMake([Utils windowHeight]-[Utils millimetersToPixels:10], [Utils millimetersToPixels:7])];
        
        [self addSubview:_webView];
        [self addSubview:_closeButton];
    }
    return self;
}

- (void) openWithPdfFile:(NSString*)path {
    self.hidden = NO;
    if ([path length]!=0) {
        NSURL *targetURL = [NSURL fileURLWithPath:path];
        NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
        [_webView loadRequest:request];
    }
}

- (void) click:(id)selector {
    if (_closeButton==selector) {
        self.hidden = YES;
    }
}

-(void)displayComposerSheetWithPdfFile:(NSString*)pdfFile address:(NSString*)address incidentId:(NSString*)incidentId
{
    NSString* subj = [NSString stringWithFormat:@"IC Tracker Report - #%@", incidentId];
    NSString* msg = [NSString stringWithFormat:@"Incident Command Tracker - Report<br>Incident ID:%@<br>Address:%@<br>", incidentId, address];
    MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
    [picker setSubject:subj];
    NSData* myData = [NSData dataWithContentsOfFile:pdfFile];
    [picker addAttachmentData:myData mimeType:@"application/pdf" fileName:pdfFile];
    [picker setMessageBody:msg isHTML:YES];
    
    picker.modalPresentationStyle = UIModalPresentationFullScreen;
    picker.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
}


@end
