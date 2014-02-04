//
//  Incident.h
//  Ictracker
//
//  Created by S. Cook on 2/3/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Incident : NSObject

@property (readonly, nonatomic, retain) NSString* address;
@property (readonly, nonatomic, retain) NSString* incidentId;

- (id)initWithAddress:(NSString*)address incidentId:(NSString*)incidentID;

@end
