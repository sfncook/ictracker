//
//  UnitDialog.m
//  Ictracker
//
//  Created by S. Cook on 2/12/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "UnitDialog.h"
#import "Utils.h"

@implementation UnitDialog

- (id)initWithDelegate:(id<UnitDialogDelegate>)delegate
{
    NSDictionary *mesaUnitsByType = [[NSDictionary alloc] initWithObjectsAndKeys:
                           @[@"E201",
                             @"E202",
                             @"E203",
                             @"E204",
                             @"E205",
                             @"E206",
                             @"E207",
                             @"E208",
                             @"E209",
                             @"E210",
                             @"E211",
                             @"E212",
                             @"E213",
                             @"E215",
                             @"E216",
                             @"E217",
                             @"E218",
                             @"E219",
                             @"E220",
                             @"E221",
                             @"E222",
                             @"E223",
                             @"E224",
                             @"E225",
                             @"E226",
                             @"E227",
                             @"E228",
                             @"E229"],
                           [NSNumber numberWithInt:UNITTYPE_ENGINE],
                           @[@"L201",
                             @"L204",
                             @"L206",
                             @"L209",
                             @"L214",
                             @"L220"],
                           [NSNumber numberWithInt:UNITTYPE_LADDER],
                           @[@"BC201",
                             @"BC202",
                             @"BC203"],
                           [NSNumber numberWithInt:UNITTYPE_BC],
                           @[@"SQ204",
                             @"SQ206",],
                           [NSNumber numberWithInt:UNITTYPE_SQUAD],
                           @[@"WT213",],
                           [NSNumber numberWithInt:UNITTYPE_WATERTENDER],
                           @[@"U202",@"U204"],
                           [NSNumber numberWithInt:UNITTYPE_UTILITY],
                           @[@"CV201",],
                           [NSNumber numberWithInt:UNITTYPE_CMDRVAN],
                           @[@"BT201",],
                           [NSNumber numberWithInt:UNITTYPE_BRUSHTRUCK],
                           @[@"AL201",],
                           [NSNumber numberWithInt:UNITTYPE_AIRLIGHTUNIT],
                           nil];
    
    NSDictionary *ajUnitsByType = [[NSDictionary alloc] initWithObjectsAndKeys:
                           @[@"E261",
                             @"E262",
                             @"E265"],
                           [NSNumber numberWithInt:UNITTYPE_ENGINE],
                           @[@"L263",
                             @"L264"],
                           [NSNumber numberWithInt:UNITTYPE_LADDER],
                           @[@"BC261"],
                           [NSNumber numberWithInt:UNITTYPE_BC],
                           @[@"WT261"],
                           [NSNumber numberWithInt:UNITTYPE_WATERTENDER],
                           @[@"BT261"],
                           [NSNumber numberWithInt:UNITTYPE_BRUSHTRUCK],
                           @[@"RH261"],
                           [NSNumber numberWithInt:UNITTYPE_REHAB],
                           nil];
    
    NSDictionary *gilbertUnitsByType = [[NSDictionary alloc] initWithObjectsAndKeys:
                           @[@"E251",
                             @"E252",
                             @"E253"],
                           [NSNumber numberWithInt:UNITTYPE_ENGINE],
                           @[@"L251",
                             @"L252"],
                           [NSNumber numberWithInt:UNITTYPE_LADDER],
                           @[@"BC291"],
                           [NSNumber numberWithInt:UNITTYPE_BC],
                           nil];
    
    NSDictionary *qcUnitsByType = [[NSDictionary alloc] initWithObjectsAndKeys:
                           @[@"E411",
                             @"E412"],
                           [NSNumber numberWithInt:UNITTYPE_ENGINE],
                           @[@"BC411"],
                           [NSNumber numberWithInt:UNITTYPE_BC],
                           nil];
    
    NSDictionary *tempeUnitsByType = [[NSDictionary alloc] initWithObjectsAndKeys:
                           @[@"E271",
                             @"E272",
                             @"E273"],
                           [NSNumber numberWithInt:UNITTYPE_ENGINE],
                           @[@"L271"],
                           [NSNumber numberWithInt:UNITTYPE_LADDER],
                           @[@"BC271"],
                           [NSNumber numberWithInt:UNITTYPE_BC],
                           nil];
    
    NSDictionary *chandlerUnitsByType = [[NSDictionary alloc] initWithObjectsAndKeys:
                           @[@"E282",
                             @"E283",
                             @"E284",
                             @"E285",
                             @"E286",
                             @"E287",
                             @"E288",
                             @"E289",],
                           [NSNumber numberWithInt:UNITTYPE_ENGINE],
                           @[@"L281",
                             @"L283"],
                           [NSNumber numberWithInt:UNITTYPE_LADDER],
                           @[@"BC281",
                             @"BC282"],
                           [NSNumber numberWithInt:UNITTYPE_BC],
                           @[@"SQ283",],
                           [NSNumber numberWithInt:UNITTYPE_SQUAD],
                           @[@"HZ283",],
                           [NSNumber numberWithInt:UNITTYPE_HAZMAT],
                           @[@"BT284",],
                           [NSNumber numberWithInt:UNITTYPE_BRUSHTRUCK],
                           @[@"UT288",],
                           [NSNumber numberWithInt:UNITTYPE_UTILITY],
                           nil];
    
    NSDictionary *unitsByCity = [[NSDictionary alloc] initWithObjectsAndKeys:
                                 mesaUnitsByType,
                                 @"Mesa",
                                 ajUnitsByType,
                                 @"AJ",
                                 gilbertUnitsByType,
                                 @"Glbt",
                                 qcUnitsByType,
                                 @"QC",
                                 tempeUnitsByType,
                                 @"Tmpe",
                                 chandlerUnitsByType,
                                 @"Chdlr",
                                 nil];
    
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
        
        ButtonView* allCitiesButton = [[ButtonView alloc] initWithName:@"ALL" delegate:self size:BUTTON_SMALL];
        [self addSubview:allCitiesButton];
        [allCitiesButton setPosition:CGPointMake(orig_x, orig_y)];
        
        NSMutableDictionary* cityViewsByCityBtnsTmp = [[NSMutableDictionary alloc] initWithCapacity:[unitsByCity count]];
        float x = allCitiesButton.frame.origin.x+allCitiesButton.frame.size.width+[Utils millimetersToPixels:2];
        float y = allCitiesButton.frame.origin.y;
        CGRect cityViewFrame = CGRectMake(self.frame.origin.x,
                                          y+[Utils millimetersToPixels:6.5],
                                          self.frame.size.width,
                                          self.frame.size.height-y+[Utils millimetersToPixels:6.5]);
        for (NSString* cityName in [unitsByCity allKeys]) {
            ButtonView* cityBtn = [[ButtonView alloc] initWithName:cityName delegate:self size:BUTTON_SMALL];
            [self addSubview:cityBtn];
            [cityBtn setPosition:CGPointMake(x, y)];
            x += cityBtn.frame.size.width+[Utils millimetersToPixels:2];
            
            UIScrollView* cityView = [[UIScrollView alloc] initWithFrame:cityViewFrame];
            
            NSDictionary *unitsByType = [unitsByCity objectForKey:cityName];
            int row = 0;
            int col = 1;
            int many_cols = 10;
            for ( int unitType=UNITTYPE_ENGINE ; unitType<UNITTYPE_MANY; unitType++){
                NSArray* unitsForType = [unitsByType objectForKey:[NSNumber numberWithInt:unitType]];
                if(unitsForType!=nil) {
                    if (row==0) {
                        row=1;
                    } else {
                        //Seperate unit types by extra space
                        if(col==1)
                            y+=[Utils millimetersToPixels:7];
                        else
                            y+=[Utils millimetersToPixels:14];
                    }
                    x = orig_x;
                    col=1;
                    for (NSString *unitName in unitsForType) {
                        ButtonView* btn = [[ButtonView alloc] initWithName:unitName delegate:self size:BUTTON_UNIT];
                        [self addSubview:btn];
                        [btn setPosition:CGPointMake(x,y)];
                        if(col%many_cols==0) {
                            row++;
                            col=1;
                            x = orig_x;
                            y += [Utils millimetersToPixels:7];
                        } else {
                            col++;
                            x += [Utils millimetersToPixels:10.5];
                        }
                    }//for
                }//if
            }//for unitType
            
            [cityViewsByCityBtnsTmp setValue:cityView forKey:cityName];
        }

    }
    return self;
}

- (void) setSelectedUnit:(NSString *)unit {
    
}

//*** ButtonClickDelegate ***
- (void) click:(id)selector {
    self.hidden = YES;
    if (_windowCancelButton==selector){
        [_delegate cancelUnitDialog];
    } else {
        ButtonView* btn = selector;
        NSString* unit = btn.name;
        [_delegate selectUnit:unit];
    }
}


@end