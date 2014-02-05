//
//  ParDialog.m
//  Ictracker
//
//  Created by S. Cook on 2/4/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "ParDialog.h"
#import "Utils.h"

@implementation ParDialog

- (id)initWithDelegate:(id<ParDialogDelegate>)delegate
{
    CGRect frame = CGRectMake(0, 0, [Utils windowHeight], [Utils windowWidth]);
    self = [super initWithFrame:frame];
    if (self) {
        _delegate = delegate;
        self.backgroundColor = [UIColor clearColor];
        
        _windowCancelButton = [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_BLANK_WINDOW];
        [_windowCancelButton setPosition:CGPointMake(0.0,0.0)];
        
        CGSize size = CGSizeMake([Utils millimetersToPixels:61.5], [Utils millimetersToPixels:9]);
        UIView* dialogBg = [[UIView alloc] initWithFrame:CGRectMake(
                                                                    [Utils windowHeight]/2-size.width/2,
                                                                    [Utils windowWidth]/2-size.height/2,
                                                                    size.width,
                                                                    size.height)];
        dialogBg.backgroundColor = [UIColor lightGrayColor];
        dialogBg.layer.borderColor = [UIColor darkGrayColor].CGColor;
        dialogBg.layer.borderWidth = 3.0;
        dialogBg.layer.cornerRadius = 5.0;
        
        [self addSubview:_windowCancelButton];
        [self addSubview:dialogBg];
        
        float orig_x = dialogBg.frame.origin.x+[Utils millimetersToPixels:1.5];
        float orig_y = dialogBg.frame.origin.y+[Utils millimetersToPixels:1.5];
        float x = orig_x;
        float y = orig_y;
        for (int par=1; par<=10; par++) {
            ButtonView* btn = [[ButtonView alloc] initWithName:[[NSNumber numberWithInt:par] stringValue] delegate:self size:BUTTON_SMALL];
            [btn setPosition:CGPointMake(x, y)];
            [self addSubview:btn];
            x+=btn.frame.size.width+[Utils millimetersToPixels:1.5];
            
            //Check if end of column
            float next_x = x+btn.frame.size.width+[Utils millimetersToPixels:1.5];
            if (next_x>dialogBg.frame.origin.x+dialogBg.frame.size.width) {
                x=orig_x;
                y+=btn.frame.size.height+[Utils millimetersToPixels:1.5];
            }
        }//for
    }
    return self;
}

- (void) setSelectedPar:(NSString*)par {
    
}

//*** ButtonClickDelegate ***
- (void) click:(id)selector {
    self.hidden = YES;
    if (_windowCancelButton==selector){
        [_delegate cancel];
    } else {
        ButtonView* btn = selector;
        NSString* par = btn.name;
        [_delegate selectPar:par];
    }
}

@end