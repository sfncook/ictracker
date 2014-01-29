//
//  IncidentEntryDelegate.h
//  Ictracker
//
//  Created by S. Cook on 1/28/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IncidentEntryDelegate <NSObject>

-(void) setAddress:(NSString*)address;
-(void) setIncidentId:(NSString*)incidentId;

@end
