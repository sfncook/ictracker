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
UIFont *bigBoldFont;
UIFont *smallFont;
UIFont *smallBoldFont;
float bigFontHeight = 18;
float smallFontHeight = 13;
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
        bigFont = [UIFont fontWithName:@"Helvetica" size:14.0];
        bigBoldFont = [UIFont fontWithName:@"Helvetica-Bold" size:14.0];
        smallFont = [UIFont fontWithName:@"Helvetica" size:10.0];
        smallBoldFont = [UIFont fontWithName:@"Helvetica-Bold" size:10.0];
        pageSize = CGSizeMake(612, 792);
    }
    return self;
}

- (void) generatePdfWithTxLogger:(TransactionLogger*)txLogger
                         address:(NSString*)address
                      incidentId:(NSString*)incidentId
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
        
        //HEADER
        [self drawPageNumber:currentPage];
        [self drawAddress:address];
        [self drawIncidentId:incidentId];
        
        done = YES;
    }
    while (!done);
    
    // Close the PDF context and write the contents out.
    UIGraphicsEndPDFContext();
    
//    NSLog(pdfFileName);
}

- (void) drawText:(NSString*)textToDraw renderingRect:(CGRect)renderingRect font:(UIFont*)font {
    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(currentContext, 0.0, 0.0, 0.0, 1.0);
    
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    paragraphStyle.alignment = NSTextAlignmentLeft;
    
    NSDictionary *attributes = @{ NSFontAttributeName: font,
                                  NSParagraphStyleAttributeName: paragraphStyle };
    
    [textToDraw drawInRect:renderingRect withAttributes:attributes];

}

- (void) drawPageNumber:(int)currentPage {
    CGRect renderingRect = CGRectMake(535, 20, 45, bigFontHeight);
    [self drawText:@"Page:" renderingRect:renderingRect font:bigBoldFont];
    
    NSString *textToDraw = [NSString stringWithFormat:@"%d", currentPage];
    renderingRect = CGRectMake(575, 20, 25, bigFontHeight);
    [self drawText:textToDraw renderingRect:renderingRect font:bigFont];
}

- (void) drawAddress:(NSString*)address {
    CGRect renderingRect = CGRectMake(20, 20, 360, bigFontHeight);
    [self drawText:address renderingRect:renderingRect font:bigFont];
}

- (void) drawIncidentId:(NSString*)incidentId {
    CGRect renderingRect = CGRectMake(380, 20, 80, bigFontHeight);
    [self drawText:@"Incident ID:" renderingRect:renderingRect font:bigBoldFont];
    
    renderingRect = CGRectMake(460, 20, 200, bigFontHeight);
    [self drawText:incidentId renderingRect:renderingRect font:bigFont];
}

@end




//    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
//    CGContextSetRGBFillColor(currentContext, 0.0, 0.0, 0.0, 1.0);
//
//    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
//    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
//    paragraphStyle.alignment = NSTextAlignmentCenter;
//
//    NSDictionary *attributes = @{ NSFontAttributeName: smallFont,
//                                  NSParagraphStyleAttributeName: paragraphStyle };
//
//    CGSize maxSize = CGSizeMake((pageSize.width - 2*borderInset-2*marginInset)/2, pageSize.height - 2*borderInset - 2*marginInset);
//
//    CGRect textSize = [address boundingRectWithSize:maxSize
//                                               options:NSStringDrawingUsesLineFragmentOrigin
//                                            attributes:attributes
//                                               context:nil];
//
//    addressRect = CGRectMake(
//                                      borderInset,
//                                      borderInset,
//                                      textSize.size.width,
//                                      textSize.size.height);
//
//    NSLog(@"address:%f,%f w:%f h:%f", borderInset, borderInset, textSize.size.width, textSize.size.height);
//
//    [address drawInRect:addressRect withAttributes:attributes];

