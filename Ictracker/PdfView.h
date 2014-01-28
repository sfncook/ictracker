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
#import "ShowMailDialogDelegate.h"

@interface PdfView : UIView<ButtonClickDelegate>

@property (readonly, retain, nonatomic) UIWebView* webView;
@property (readonly, retain, nonatomic) ImgButton* closeButton;
@property (readonly, retain, nonatomic) id<ShowMailDialogDelegate> delegate;

- (id)initWithDelegate:(id<ShowMailDialogDelegate>)delegate;
- (void) openWithPdfFile:(NSString*)path;

@end
