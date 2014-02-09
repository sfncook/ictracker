//
//  PickerDelegate.h
//  Ictracker
//
//  Created by S. Cook on 2/8/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PickerDelegate <NSObject>

-(void) cancelPicker;
-(void) selectItem:(NSString*)itemStr picker:(id)picker;

@end
