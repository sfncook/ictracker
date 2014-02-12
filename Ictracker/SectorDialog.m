//
//  SectorDialog.m
//  Ictracker
//
//  Created by S. Cook on 2/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "SectorDialog.h"
#import "Utils.h"

@implementation SectorDialog

- (id)initWithDelegate:(id<SectorDialogDelegate>)delegate
{
    NSArray *sectorNames = @[
                             @"REHAB",
                             @"RESCUE",
                             @"Sector 1",
                             @"Sector 2",
                             @"Sector 3",
                             @"Sector 4",
                             @"A Sector",
                             @"B Sector",
                             @"C Sector",
                             @"D Sector",
                             @"North Sector",
                             @"East Sector",
                             @"South Sector",
                             @"West Sector",
                             @"Interior",
                             @"Roof",
                             @"Ventilation",
                             @"Salvage",
                             @"Cust Service",
                             @"Sprinkler",
                             @"Stand-pipe",
                             @"On Deck",
                             @"IRIC",
                             @"RIC",
                             @"Medical",
                             @"Safety",
                             @"Staging",
                             @"Lobby",
                             @"Treatment",
                             @"Evacuation",
                             @"Resource",
                             @"Transportation",
                             @"Accountability",
                             @"Triage"];

    CGRect frame = CGRectMake(0, 0, [Utils windowHeight], [Utils windowWidth]);
    self = [super initWithFrame:frame];
    if (self) {
        _delegate = delegate;
        self.backgroundColor = [UIColor clearColor];
        
        _windowCancelButton = [[ButtonView alloc] initWithName:@"" delegate:self size:BUTTON_BLANK_WINDOW];
        [_windowCancelButton setPosition:CGPointMake(0.0,0.0)];
        
        CGSize size = CGSizeMake([Utils millimetersToPixels:108.5], [Utils millimetersToPixels:60.5]);
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
        for (NSString* sectorName in sectorNames) {
            ButtonView* btn = [[ButtonView alloc] initWithName:sectorName delegate:self size:BUTTON_WIDE];
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

- (void) setSelectedSector:(NSString *)sector {
    
}

//*** ButtonClickDelegate ***
- (void) click:(id)selector {
    self.hidden = YES;
    if (_windowCancelButton==selector){
        [_delegate cancelSectorDialog];
    } else {
        ButtonView* btn = selector;
        NSString* sector = btn.name;
        [_delegate selectSector:sector];
    }
}


@end
