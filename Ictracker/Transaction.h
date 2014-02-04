//
//  Transaction.h
//  Ictracker
//
//  Created by S. Cook on 1/25/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum transType {
    TRANSTYPE_ADD_TITLE_TO_SECTOR,
    TRANSTYPE_ADD_UNIT_TO_ACCT,
    TRANSTYPE_ADD_UNIT_TO_SECTOR,
    TRANSTYPE_ADD_ACTION_TO_SECTOR,
    TRANSTYPE_SET_SECTOR_REHAB,
    TRANSTYPE_SET_SECTOR_RESCUE,
    TRANSTYPE_CHECK,
    TRANSTYPE_UNCHECK,
    TRANSTYPE_COMPLETE,
    TRANSTYPE_SET_SAFETY,
    TRANSTYPE_SET_MODE,
    } TransType;

@interface Transaction : NSObject

@property (readonly, nonatomic, assign) TransType transType;
@property (readonly, nonatomic, retain) NSArray* params;
@property (readonly, nonatomic, retain) NSDate* date;

+ (instancetype)transactionWithType:(TransType)type date:(NSDate*)date param:(NSObject*)param, ... NS_REQUIRES_NIL_TERMINATION;

@end
