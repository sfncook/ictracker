//
//  TransactionController.h
//  Ictracker
//
//  Created by S. Cook on 1/25/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Transaction.h"

@interface TransactionController : NSObject

- (NSString*) transactionToString:(Transaction*)transaction;

@end
