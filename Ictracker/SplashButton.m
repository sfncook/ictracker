//
//  SplashButton.m
//  Ictracker
//
//  Created by S. Cook on 1/26/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "SplashButton.h"

@implementation SplashButton

- (id)initWithImage:(NSString*)imageName delegate:(id<ButtonClickDelegate>)delegate
{
    CGRect frame = CGRectMake(0, 0, 250, 250);
    self = [super initWithFrame:frame];
    if (self) {
        _imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        _imgView.layer.borderColor = [UIColor blackColor].CGColor;
        _imgView.layer.borderWidth = 3.0;
        _imgView.layer.cornerRadius = 15.0;
        [_imgView setFrame:frame];
        [self addSubview:_imgView];
        _delegate = delegate;
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    _imgView.layer.borderColor = [UIColor blueColor].CGColor;
    _imgView.layer.borderWidth = 6.0;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    _imgView.layer.borderWidth = 3.0;
    _imgView.layer.cornerRadius = 15.0;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    _imgView.layer.borderWidth = 3.0;
    _imgView.layer.cornerRadius = 15.0;
    [_delegate click:self];
}

- (void) setPosition:(CGPoint)position
{
    self.frame = CGRectMake(position.x, position.y, self.frame.size.width, self.frame.size.height);
}

@end



