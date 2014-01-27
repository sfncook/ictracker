//
//  PdfView.h
//  Ictracker
//
//  Created by S. Cook on 1/27/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PdfView : UIView

@property (readonly, retain, nonatomic) UIWebView* webView;

- (id)initWithPdfFile:(NSString*)path;

@end
