//
//  SectorDialogDelegate.h
//  Ictracker
//
//  Created by S. Cook on 2/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SectorDialogDelegate <NSObject>

-(void) cancelSectorDialog;
-(void) selectSector:(NSString*)sector;

@end
