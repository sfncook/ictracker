//
//  ActionMenuDelegate.h
//  Ictracker
//
//  Created by S. Cook on 1/14/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ActionMenuDelegate <NSObject>

- (void) onClickAction:(NSString*)actionTitle;

@end
