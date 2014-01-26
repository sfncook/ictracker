//
//  TransactionFormatter.h
//  Ictracker
//
//  Created by S. Cook on 1/25/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TransactionLogger.h"

@interface TransactionFormatter : NSObject

@property (readonly, nonatomic, retain) NSMutableArray* transactions;
@property (readonly, nonatomic, retain) NSDateFormatter *formatter;

- (id)initWithTransactionLogger:(TransactionLogger*)txLogger;
- (BOOL) renderNextPage:(CGFloat)start_y pageHeight:(CGFloat)pageHeight pageWidth:(CGFloat)pageWidth;

@end
