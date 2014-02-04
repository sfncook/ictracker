//
//  TransactionLogger.m
//  Ictracker
//
//  Created by S. Cook on 1/25/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "TransactionLogger.h"

@implementation TransactionLogger
static TransactionLogger *transLogger;

+ (TransactionLogger *)transLogger
{
    @synchronized(self)
    {
        if (!transLogger)
            transLogger = [[TransactionLogger alloc] init];
        
        return transLogger;
    }
}

+ (TransactionLogger *)createNewTransLogger
{
    @synchronized(self)
    {
        transLogger = [[TransactionLogger alloc] init];
        return transLogger;
    }
}

- (id)init
{
    self = [super init];
    if (self) {
        _transactions = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) addTransaction:(Transaction*)tx {
    [_transactions addObject:tx];
}

@end
