//
//  ReportFormatter.m
//  Ictracker
//
//  Created by S. Cook on 1/25/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "ReportFormatter.h"

@implementation ReportFormatter

UIFont *bigFont;
UIFont *smallFont;
float borderInset = 20;
float marginInset = 20;
CGSize pageSize;

- (id)init
{
    self = [super init];
    if (self) {
        bigFont = [UIFont systemFontOfSize:14.0];
        smallFont = [UIFont systemFontOfSize:10.0];
        pageSize = CGSizeMake(612, 792);
    }
    return self;
}

- (void) generatePdfWithTxLogger:(TransactionLogger*)txLogger
{
    
    NSString *fileName = @"ICTracker_report.pdf";
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *pdfFileName = [documentsDirectory stringByAppendingPathComponent:fileName];
    
    UIGraphicsBeginPDFContextToFile(pdfFileName, CGRectZero, nil);
    
    NSInteger currentPage = 0;
    BOOL done = NO;
    do
    {
        // Mark the beginning of a new page.
        UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, pageSize.width, pageSize.height), nil);
        
        // Draw a page number at the bottom of each page.
        currentPage++;
        [self drawPageNumber:currentPage];
        
//        [self drawHeader];
//
//        //Draw a border for each page.
//        [self drawBorder];
//        
//        //Draw text fo our header.
//        [self drawHeader];
//        
//        //Draw a line below the header.
//        [self drawLine];
//        
//        //Draw some text for the page.
//        [self drawText];
//        
//        //Draw an image
//        [self drawImage];
        done = YES;
    }
    while (!done);
    
    // Close the PDF context and write the contents out.
    UIGraphicsEndPDFContext();
    
//    NSLog(pdfFileName);
}

- (void) drawPageNumber:(int)currentPage {
    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(currentContext, 0.0, 0.0, 0.0, 1.0);
    
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    paragraphStyle.alignment = NSTextAlignmentRight;
    
    NSDictionary *attributes = @{ NSFontAttributeName: bigFont,
                                  NSParagraphStyleAttributeName: paragraphStyle };
    
    CGSize maxSize = CGSizeMake(pageSize.width - 2*borderInset-2*marginInset, pageSize.height - 2*borderInset - 2*marginInset);
    
    NSString *textToDraw = [NSString stringWithFormat:@"Page:%d", currentPage];
    
    CGRect textSize = [textToDraw boundingRectWithSize:maxSize
                       options:NSStringDrawingUsesLineFragmentOrigin
                    attributes:attributes
                       context:nil];
    
    CGRect renderingRect = CGRectMake(
                                      pageSize.width-borderInset-textSize.size.width,
                                      borderInset,
                                      textSize.size.width,
                                      textSize.size.height);
    
    [textToDraw drawInRect:renderingRect withAttributes:attributes];
}


@end



