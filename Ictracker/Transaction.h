//
//  Transaction.h
//  Ictracker
//
//  Created by S. Cook on 1/25/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum transType {
    TRANSTYPE_ADD_TITLE_TO_SECTOR
    } TransType;

@interface Transaction : NSObject

@property (readonly, nonatomic, assign) TransType transType;
@property (readonly, nonatomic, retain) NSArray* params;
@property (readonly, nonatomic, retain) NSDate* date;

+ (instancetype)transactionWithType:(TransType)type date:(NSDate*)date param:(NSObject*)param, ... NS_REQUIRES_NIL_TERMINATION;

@end
