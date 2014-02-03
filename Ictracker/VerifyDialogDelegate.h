//
//  VerifyDialogDelegate.h
//  Ictracker
//
//  Created by S. Cook on 2/2/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VerifyDialogDelegate <NSObject>

- (void) pickAffirmative;
- (void) pickNegative;
- (void) pickCancel;

@end
