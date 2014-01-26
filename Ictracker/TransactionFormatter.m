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
float col1_x = 80;
UIFont *font;

- (id)initWithTransactionLogger:(TransactionLogger*)txLogger
{
    self = [super init];
    if (self) {
        _transactions = [[NSMutableArray alloc] initWithArray:txLogger.transactions];
        _formatter = [[NSDateFormatter alloc] init];
        [_formatter setDateFormat:@"hh:mm:ss a"];
        font = [UIFont fontWithName:@"Helvetica" size:14.0];
    }
    return self;
}

// returns: YES if tx remain to be rendered.  NO if all tx's were logged.
- (BOOL) renderNextPage:(CGFloat)start_y pageHeight:(CGFloat)pageHeight pageWidth:(CGFloat)pageWidth
{
    double y=start_y;
    CGRect dateRect;
    CGRect eventRect;
    
    while (_transactions.count>0) {
        Transaction* tx = [_transactions objectAtIndex:0];
        [_transactions removeObjectAtIndex:0];
        NSString* eventText = [self getEventStringWithTransaction:tx];
        if ([eventText length]>0) {
            {//*** date ***
                NSString* dateString;
                dateString = [_formatter stringFromDate:tx.date];
                
                CGContextRef    currentContext = UIGraphicsGetCurrentContext();
                CGContextSetRGBFillColor(currentContext, 0.0, 0.0, 0.0, 1.0);
                
                NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
                paragraphStyle.lineBreakMode = NSLineBreakByClipping;
                paragraphStyle.alignment = NSTextAlignmentLeft;
                
                NSDictionary *attributes = @{ NSFontAttributeName: font,
                                              NSParagraphStyleAttributeName: paragraphStyle };
                
                CGSize maxSize = CGSizeMake(col1_x, 100);
                
                CGRect textSize = [dateString boundingRectWithSize:maxSize
                                                           options:NSStringDrawingUsesLineFragmentOrigin
                                                        attributes:attributes
                                                           context:nil];
                
                dateRect = CGRectMake(
                                            borderInset2,
                                            y,
                                            textSize.size.width,
                                            textSize.size.height);
                
                [dateString drawInRect:dateRect withAttributes:attributes];
                
            }
            
            {//*** event ***
                CGContextRef    currentContext = UIGraphicsGetCurrentContext();
                CGContextSetRGBFillColor(currentContext, 0.0, 0.0, 0.0, 1.0);
                
                NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
                paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
                paragraphStyle.alignment = NSTextAlignmentLeft;
                
                NSDictionary *attributes = @{ NSFontAttributeName: font,
                                              NSParagraphStyleAttributeName: paragraphStyle };
                
                float x = dateRect.origin.x+dateRect.size.width+30;
                CGSize maxSize = CGSizeMake(pageWidth-x-borderInset2, 100);
                
                CGRect textSize = [eventText boundingRectWithSize:maxSize
                                                          options:NSStringDrawingUsesLineFragmentOrigin
                                                       attributes:attributes
                                                          context:nil];
                
                eventRect = CGRectMake(
                                       x,
                                       y,
                                       textSize.size.width,
                                       textSize.size.height);
                
                [eventText drawInRect:eventRect withAttributes:attributes];
            }
            
            y = y+eventRect.size.height+10;
        }//if event!=empty
        
    }
    
    return NO;
}

-(NSString*) getEventStringWithTransaction:(Transaction*)tx {
    switch (tx.transType) {
        case TRANSTYPE_ADD_TITLE_TO_SECTOR:
        {
            NSString* sectorTitle = [tx.params objectAtIndex:0];
            return [NSString stringWithFormat:@"Add sector title:%@", sectorTitle];
        }
        case TRANSTYPE_ADD_UNIT_TO_ACCT:
        {
            NSString* unit = [tx.params objectAtIndex:0];
            SectorTBarView* sector = [tx.params objectAtIndex:1];
            NSString* sectorTitle = sector.titleButton.name;
            return [NSString stringWithFormat:@"Set accountability unit:%@ to sector:%@", unit, sectorTitle];
        }
        case TRANSTYPE_ADD_UNIT_TO_SECTOR:
        {
            NSString* unit = [tx.params objectAtIndex:0];
            SectorTBarView* sector = [tx.params objectAtIndex:1];
            NSString* sectorTitle = sector.titleButton.name;
            return [NSString stringWithFormat:@"Add unit:%@ to sector:%@", unit, sectorTitle];
        }
        case TRANSTYPE_ADD_ACTION_TO_SECTOR:
        {
            NSString* action = [tx.params objectAtIndex:0];
            SectorTBarView* sector = [tx.params objectAtIndex:1];
            NSString* sectorTitle = sector.titleButton.name;
            return [NSString stringWithFormat:@"Add action:%@ to sector:%@", action, sectorTitle];
        }
        case TRANSTYPE_SET_SECTOR_REHAB:
        {
            return @"";
        }
        case TRANSTYPE_SET_SECTOR_RESCUE:
        {
            return @"";
        }
            
        default:
            break;
    }
    return @"";
}

@end


