//
//  TransactionLogger.h
//  Ictracker
//
//  Created by S. Cook on 1/25/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Transaction.h"

@interface TransactionLogger : NSObject

@property (readonly, nonatomic, retain) NSMutableArray* transactions;

+ (TransactionLogger *)transLogger;
+ (TransactionLogger *)createNewTransLogger;
- (void) addTransaction:(Transaction*)tx;

@end
