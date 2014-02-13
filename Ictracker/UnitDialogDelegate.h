//
//  UnitDialogDelegate.h
//  Ictracker
//
//  Created by S. Cook on 2/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UnitDialogDelegate <NSObject>

-(void) cancelUnitDialog;
-(void) selectUnit:(NSString*)unit;

@end
