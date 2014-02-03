//
//  VerifyDialog.m
//  Ictracker
//
//  Created by S. Cook on 2/2/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "VerifyDialog.h"
#import "Utils.h"

@implementation VerifyDialog

- (id)initWithDelegate:(id<VerifyDialogDelegate>)delegate msg:(NSString*)msg
{
    CGRect frame = CGRectMake(0, 0, [Utils windowHeight], [Utils windowWidth]);
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _delegate = delegate;
        
        _windowCancelButton = [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_BLANK_WINDOW];
        [_windowCancelButton setPosition:CGPointMake(0.0,0.0)];
        
        CGSize size = CGSizeMake([Utils millimetersToPixels:80], [Utils millimetersToPixels:40]);
        UIView* dialogBg = [[UIView alloc] initWithFrame:CGRectMake(
                                                                    [Utils windowHeight]/2-size.width/2,
                                                                    [Utils windowWidth]/3-size.height/2,
                                                                    size.width,
                                                                    size.height)];
        dialogBg.backgroundColor = [UIColor lightGrayColor];
        dialogBg.layer.borderColor = [UIColor darkGrayColor].CGColor;
        dialogBg.layer.borderWidth = 3.0;
        dialogBg.layer.cornerRadius = 5.0;
        
        _affimativeButton = [[ButtonView alloc] initWithName:@"YES" delegate:self size:BUTTON_LARGE];
        [_affimativeButton setPosition:CGPointMake(
                                                     [Utils windowHeight]/2-[Utils millimetersToPixels:20],
                                                     [Utils windowWidth]/3+size.height/2-[Utils millimetersToPixels:15])];
        
        _negativeButton = [[ButtonView alloc] initWithName:@"NO" delegate:self size:BUTTON_LARGE];
        [_negativeButton setPosition:CGPointMake(
                                                   [Utils windowHeight]/2+[Utils millimetersToPixels:20]-_negativeButton.frame.size.width,
                                                   [Utils windowWidth]/3+size.height/2-[Utils millimetersToPixels:15])];
        
        UILabel* msgLabel = [[UILabel alloc] initWithFrame:CGRectMake(
                                                                      [Utils windowHeight]/2-size.width/2+[Utils millimetersToPixels:4],
                                                                      [Utils windowWidth]/3-size.height/2,
                                                                      size.width-[Utils millimetersToPixels:8],
                                                                      size.height/3*2)];
        [msgLabel setText:msg];
        [msgLabel setLineBreakMode:NSLineBreakByWordWrapping];
        msgLabel.numberOfLines=0;
        
        [self addSubview:_windowCancelButton];
        [self addSubview:dialogBg];
        [self addSubview:_affimativeButton];
        [self addSubview:_negativeButton];
        [self addSubview:msgLabel];
    }
    return self;
}

- (void) click:(id)selector {
    self.hidden = YES;
    if (_windowCancelButton==selector){
        [_delegate pickCancel];
    }
    if (_affimativeButton==selector){
        [_delegate pickAffirmative];
    }
    if (_negativeButton==selector){
        [_delegate pickNegative];
    }
}

@end
