//
//  Incident.m
//  Ictracker
//
//  Created by S. Cook on 2/3/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "Incident.h"

@implementation Incident

- (id)initWithAddress:(NSString*)address incidentId:(NSString*)incidentID
{
    self = [super init];
    if (self) {
        _address = address;
        _incidentId = incidentID;
    }
    return self;
}

@end
