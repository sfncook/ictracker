//
//  IctTextField.h
//  Ictracker
//
//  Created by S. Cook on 1/28/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IctTextField : UITextField

- (id)initWithPlaceholder:(NSString*)placeholder;
- (void) setPosition:(CGPoint)position;

@end
