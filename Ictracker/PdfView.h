//
//  PdfView.h
//  Ictracker
//
//  Created by S. Cook on 1/27/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImgButton.h"
#import "ButtonClickDelegate.h"

@interface PdfView : UIView<ButtonClickDelegate>

@property (readonly, retain, nonatomic) UIWebView* webView;
@property (readonly, retain, nonatomic) ImgButton* closeButton;

- (void) openWithPdfFile:(NSString*)path;

@end
