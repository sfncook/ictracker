//
//  PdfView.m
//  Ictracker
//
//  Created by S. Cook on 1/27/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "PdfView.h"
#import "Utils.h"

@implementation PdfView

- (id)init
{
    self = [super initWithFrame:CGRectMake(0, 0, [Utils windowHeight], [Utils windowWidth])];
    if (self) {
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

@end
