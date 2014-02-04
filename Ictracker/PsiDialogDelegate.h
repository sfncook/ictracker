//
//  PsiDialogDelegate.h
//  Ictracker
//
//  Created by S. Cook on 2/3/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PsiDialogDelegate <NSObject>

-(void) cancel;
-(void) selectPsi:(NSString*)psi;

@end
