//
//  ReportFormatter.h
//  Ictracker
//
//  Created by S. Cook on 1/25/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TransactionLogger.h"

@interface ReportFormatter : NSObject

- (NSString*) generatePdfWithTxLogger:(TransactionLogger*)txLogger
                            address:(NSString*)address
                            incidentId:(NSString*)incidentId
                            title:(NSString*)title;

@end
