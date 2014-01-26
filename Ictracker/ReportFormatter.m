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

CGRect addressRect;
CGRect incidentIdRect;
CGRect titleRect;

- (id)init
{
    self = [super init];
    if (self) {
        bigFont = [UIFont fontWithName:@"Helvetica-Bold" size:14.0];
        smallFont = [UIFont fontWithName:@"Helvetica-Bold" size:10.0];
        pageSize = CGSizeMake(612, 792);
    }
    return self;
}

- (void) generatePdfWithTxLogger:(TransactionLogger*)txLogger
                         address:(NSString*)address
                      incidentId:(NSString*)incidentId
                     reportTitle:(NSString*)reportTitle
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
        
        //This order is import:
        [self drawTitle:reportTitle];
        [self drawAddress:address];
        [self drawIncidentId:incidentId];
        
        
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
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
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
    
    NSLog(@"page number:%f, %f", pageSize.width-borderInset-textSize.size.width, borderInset);
    
    [textToDraw drawInRect:renderingRect withAttributes:attributes];
}

- (void) drawAddress:(NSString*)address {
    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(currentContext, 0.0, 0.0, 0.0, 1.0);
    
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{ NSFontAttributeName: smallFont,
                                  NSParagraphStyleAttributeName: paragraphStyle };
    
    CGSize maxSize = CGSizeMake((pageSize.width - 2*borderInset-2*marginInset)/2, pageSize.height - 2*borderInset - 2*marginInset);
    
    CGRect textSize = [address boundingRectWithSize:maxSize
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                            attributes:attributes
                                               context:nil];
    
    addressRect = CGRectMake(
                                      borderInset,
                                      borderInset,
                                      textSize.size.width,
                                      textSize.size.height);
    
    NSLog(@"address:%f, %f", borderInset, borderInset);
    
    [address drawInRect:addressRect withAttributes:attributes];
}

- (void) drawIncidentId:(NSString*)incidentId {
    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(currentContext, 0.0, 0.0, 0.0, 1.0);
    
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{ NSFontAttributeName: smallFont,
                                  NSParagraphStyleAttributeName: paragraphStyle };
    
    CGSize maxSize = CGSizeMake((pageSize.width - 2*borderInset-2*marginInset)/2, pageSize.height - 2*borderInset - 2*marginInset);
    
    NSString* textToRender = [NSString stringWithFormat:@"Incident ID:%@", incidentId];
    
    CGRect textSize = [textToRender boundingRectWithSize:maxSize
                                            options:NSStringDrawingUsesLineFragmentOrigin
                                         attributes:attributes
                                            context:nil];
    
    incidentIdRect = CGRectMake(
                             borderInset,
                             addressRect.origin.y+addressRect.size.height,
                             textSize.size.width,
                             textSize.size.height);
    
    [textToRender drawInRect:incidentIdRect withAttributes:attributes];
}

- (void) drawTitle:(NSString*)title {
    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(currentContext, 0.0, 0.0, 0.0, 1.0);
    
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{ NSFontAttributeName: smallFont,
                                  NSParagraphStyleAttributeName: paragraphStyle };
    
    CGSize maxSize = CGSizeMake((pageSize.width - 2*borderInset-2*marginInset)/2, pageSize.height - 2*borderInset - 2*marginInset);
    
    CGRect textSize = [title boundingRectWithSize:maxSize
                                            options:NSStringDrawingUsesLineFragmentOrigin
                                         attributes:attributes
                                            context:nil];
    
    addressRect = CGRectMake(
                             borderInset,
                             borderInset,
                             textSize.size.width,
                             textSize.size.height);
    
    [title drawInRect:addressRect withAttributes:attributes];
}

@end



