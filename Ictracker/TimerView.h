//
//  TimerView.h
//  Ictracker
//
//  Created by S. Cook on 1/20/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimerView : UIView

@property (retain, atomic) NSDate* startTime;
@property (retain, atomic) NSMutableString* curTime;
@property (readonly, retain, nonatomic) NSTimer* timer;

@end
