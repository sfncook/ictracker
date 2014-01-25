//
//  Transaction.h
//  Ictracker
//
//  Created by S. Cook on 1/25/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Transaction : NSObject

@property (readonly, nonatomic, retain) NSString* param1;
@property (readonly, nonatomic, retain) NSDate* date;

@end
