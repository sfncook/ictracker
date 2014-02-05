//
//  ParDialogDelegate.h
//  Ictracker
//
//  Created by S. Cook on 2/4/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ParDialogDelegate <NSObject>

-(void) cancelPar;
-(void) selectPar:(NSString*)par;
@end
