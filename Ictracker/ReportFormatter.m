//
//  ReportFormatter.m
//  Ictracker
//
//  Created by S. Cook on 1/25/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "ReportFormatter.h"

@implementation ReportFormatter

- (void) generatePdfWithTxLogger:(TransactionLogger*)txLogger
{
    CGSize pageSize = CGSizeMake(612, 792);
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
//        [self drawPageNumber:currentPage];
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
    
    NSLog(pdfFileName);
}

@end
