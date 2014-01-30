//
//  TransactionFormatter.m
//  Ictracker
//
//  Created by S. Cook on 1/25/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "TransactionFormatter.h"
#import "Transaction.h"
#import "SectorTBarView.h"

@implementation TransactionFormatter

float borderInset2 = 20;
int colWidths[4];
float row_height = 20;
UIFont *font;

- (id)init
{
    self = [super init];
    if (self) {
        _formatter = [[NSDateFormatter alloc] init];
        [_formatter setDateFormat:@"hh:mm:ss a"];
        font = [UIFont fontWithName:@"Helvetica" size:14.0];
        _txIndex = 0;
        colWidths[0] = 120;
        colWidths[1] = 120;
        colWidths[2] = 160;
        colWidths[3] = 200;
    }
    return self;
}

- (void) reset {
    _txIndex = 0;
}

// returns: YES if tx remain to be rendered.  NO if all tx's were logged.
- (BOOL) renderNextPage:(CGFloat)start_y
             pageHeight:(CGFloat)pageHeight
              pageWidth:(CGFloat)pageWidth
           transactions:(NSArray*)transactions
{
 
    NSMutableArray* allEventStrs = [[NSMutableArray alloc] init];
    for (int i=_txIndex; i<[transactions count]; i++) {
        Transaction* tx = [transactions objectAtIndex:i];
        NSArray* eventStrs = [self getEventStringsWithTransaction:tx];
        if ([eventStrs count]>0) {
            [allEventStrs addObject:eventStrs];
        }
        
    }
    
    double y=start_y;
    for (NSArray* eventStrs in allEventStrs) {
        int col = 0;
        float x=borderInset2;
        for (NSString* eventStr in eventStrs) {
            
            CGContextRef    currentContext = UIGraphicsGetCurrentContext();
            CGContextSetRGBFillColor(currentContext, 0.0, 0.0, 0.0, 1.0);
            
            NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
            paragraphStyle.lineBreakMode = NSLineBreakByClipping;
            paragraphStyle.alignment = NSTextAlignmentLeft;
            
            NSDictionary *attributes = @{ NSFontAttributeName: font,
                                          NSParagraphStyleAttributeName: paragraphStyle };
            
            CGSize maxSize = CGSizeMake(colWidths[col], 100);
            
            CGRect textSize = [eventStr boundingRectWithSize:maxSize
                                                       options:NSStringDrawingUsesLineFragmentOrigin
                                                    attributes:attributes
                                                       context:nil];
            
            CGRect renderRect = CGRectMake(
                                  x,
                                  y,
                                  colWidths[col],
                                  textSize.size.height);
            
            [eventStr drawInRect:renderRect withAttributes:attributes];
            x+=colWidths[col];
            col++;
        }//for eventStr
        _txIndex++;
        y = y+row_height+10;
        
        if (y+row_height+10>pageHeight) {
            return YES;
        }
    }//for allEventStrs
    
    return NO;
}


-(NSArray*) getEventStringsWithTransaction:(Transaction*)tx {
    NSArray* eventStrs;
    NSString* dateString = [_formatter stringFromDate:tx.date];
    switch (tx.transType) {
        case TRANSTYPE_ADD_TITLE_TO_SECTOR:
        {
            eventStrs = [NSArray arrayWithObjects: nil];
            break;
        }
        case TRANSTYPE_ADD_UNIT_TO_ACCT:
        {
            NSString* unit = [tx.params objectAtIndex:0];
            SectorTBarView* sector = [tx.params objectAtIndex:1];
            NSString* sectorTitle = sector.titleButton.name;
            eventStrs = [NSArray arrayWithObjects:
                         dateString,
                         sectorTitle,
                         @"Set accountability unit:",
                         unit,
                         nil];
            break;
        }
        case TRANSTYPE_ADD_UNIT_TO_SECTOR:
        {
            NSString* unit = [tx.params objectAtIndex:0];
            SectorTBarView* sector = [tx.params objectAtIndex:1];
            NSString* sectorTitle = sector.titleButton.name;
            eventStrs = [NSArray arrayWithObjects:
                         dateString,
                         sectorTitle,
                         @"Add unit:",
                         unit,
                         nil];
            break;
        }
        case TRANSTYPE_ADD_ACTION_TO_SECTOR:
        {
            NSString* action = [tx.params objectAtIndex:0];
            SectorTBarView* sector = [tx.params objectAtIndex:1];
            NSString* sectorTitle = sector.titleButton.name;
            eventStrs = [NSArray arrayWithObjects:
                         dateString,
                         sectorTitle,
                         @"Add action:",
                         action,
                         nil];
            break;
        }
        case TRANSTYPE_SET_SECTOR_REHAB:
        {
            eventStrs = [NSArray arrayWithObjects: nil];
            break;
        }
        case TRANSTYPE_SET_SECTOR_RESCUE:
        {
            eventStrs = [NSArray arrayWithObjects: nil];
            break;
        }
//        case TRANSTYPE_CHECK:
//        {
//            NSString* checkBtn = [tx.params objectAtIndex:0];
//            eventStrs = [NSArray arrayWithObjects:
//                         dateString,
//                         checkBtn,
//                         @"SET:",
//                         nil];
//            break;
//        }
            
        default:
        {
            eventStrs = [NSArray arrayWithObjects: nil];
            break;
        }
    }//switch
    return eventStrs;
}

@end


