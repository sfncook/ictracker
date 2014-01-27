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

- (id)initWithPdfFile:(NSString*)path
{
    self = [super initWithFrame:CGRectMake(0, 0, [Utils windowHeight], [Utils windowWidth])];
    if (self) {
        _webView=[[UIWebView alloc] initWithFrame:self.frame];
        _webView.scalesPageToFit = YES;
        
        NSURL *targetURL = [NSURL fileURLWithPath:path];
        NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
        
        [_webView loadRequest:request];
        [self addSubview:_webView];
    }
    return self;
}


@end
