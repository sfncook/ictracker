//
//  ShowMailDialogDelegate.h
//  Ictracker
//
//  Created by S. Cook on 1/27/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MessageUI/MFMailComposeViewController.h>

@protocol ShowMailDialogDelegate <NSObject>

- (void) showmailDialog:(MFMailComposeViewController*)mailCtl;

@end
