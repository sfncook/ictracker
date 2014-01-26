//
//  Transaction.m
//  Ictracker
//
//  Created by S. Cook on 1/25/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "Transaction.h"

@implementation Transaction

- (id)initWithTransType:(TransType)transType params:(NSArray*)params date:(NSDate*)date
{
    self = [super init];
    if (self) {
        _transType = transType;
        _params = params;
        _date = date;
        
    }
    return self;
}

+ (instancetype)transactionWithType:(TransType)type date:(NSDate*)date param:(NSObject*)param, ... NS_REQUIRES_NIL_TERMINATION
{
    NSMutableArray* params = [[NSMutableArray alloc] init];
    va_list args;
    va_start(args, param);
    for (NSObject *arg = param; arg != nil; arg = va_arg(args, NSObject*))
    {
        [params addObject:arg];
    }
    va_end(args);
    
    Transaction* transaction = [[Transaction alloc] initWithTransType:type params:params date:date];
    return transaction;
}


@end
