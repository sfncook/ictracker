//
//  SplashDelegate.h
//  Ictracker
//
//  Created by S. Cook on 1/26/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Incident.h"

@protocol SplashDelegate <NSObject>

-(void) showSplash;
-(void) showFire;
-(void) showEms;
-(void) showPdfReport;
-(void) completeIncident;

@end
