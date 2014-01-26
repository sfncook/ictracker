//
//  ReportFormatter.m
//  Ictracker
//
//  Created by S. Cook on 1/25/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "ReportFormatter.h"
//#import "TransactionFormatter.h"

@implementation ReportFormatter

UIFont *bigFont;
UIFont *bigBoldFont;
UIFont *smallFont;
UIFont *smallBoldFont;
float bigFontHeight = 18;
float smallFontHeight = 13;
float borderInset = 20;
CGSize pageSize;

CGRect addressRect;
CGRect titleRect;
CGRect incidentIdRect;
CGRect incidentIdLabelRect;
CGRect pageNumberRect;
CGRect pageLabelRect;

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
                           title:(NSString*)title
{
//    TransactionFormatter* txFormatter = [[TransactionFormatter alloc] init];
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
        
        //HEADER - The order of these function calls matters
        [self drawTitle:title];
        [self drawPageNumber:currentPage];
        [self drawIncidentId:incidentId];
        [self drawAddress:address];
        [self drawHeaderLine];
        
//        [txFormatter renderTransactionLog:txLogger];
        
        done = YES;
    }
    while (!done);
    
    // Close the PDF context and write the contents out.
    UIGraphicsEndPDFContext();
    
//    NSLog(pdfFileName);
}

- (void) drawTitle:(NSString*)title {
    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(currentContext, 0.0, 0.0, 0.0, 1.0);
    
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{ NSFontAttributeName: bigBoldFont,
                                  NSParagraphStyleAttributeName: paragraphStyle };
    
    CGSize maxSize = CGSizeMake(pageSize.width-2*borderInset, pageSize.height-2*borderInset);
    
    CGRect textSize = [title boundingRectWithSize:maxSize
                                            options:NSStringDrawingUsesLineFragmentOrigin
                                         attributes:attributes
                                            context:nil];
    
    titleRect = CGRectMake(
                             borderInset,
                             borderInset,
                             pageSize.width-2*borderInset,
                             textSize.size.height);
    
    [title drawInRect:titleRect withAttributes:attributes];
}

- (void) drawPageNumber:(int)currentPage {
    {//*** page number ***
        NSString *pageNumber = [NSString stringWithFormat:@"%d", currentPage];
        CGContextRef    currentContext = UIGraphicsGetCurrentContext();
        CGContextSetRGBFillColor(currentContext, 0.0, 0.0, 0.0, 1.0);
        
        NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        paragraphStyle.alignment = NSTextAlignmentLeft;
        
        NSDictionary *attributes = @{ NSFontAttributeName: bigFont,
                                      NSParagraphStyleAttributeName: paragraphStyle };
        
        CGSize maxSize = CGSizeMake(100, 100);
        
        CGRect textSize = [pageNumber boundingRectWithSize:maxSize
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                attributes:attributes
                                                   context:nil];
        
        pageNumberRect = CGRectMake(
                                  pageSize.width-borderInset-textSize.size.width,
                                  titleRect.origin.y+titleRect.size.height+10,
                                  textSize.size.width,
                                  textSize.size.height);
        
        [pageNumber drawInRect:pageNumberRect withAttributes:attributes];
    }
    
    {//*** label ***
        NSString* pageLabel = @"Page:";
        CGContextRef    currentContext = UIGraphicsGetCurrentContext();
        CGContextSetRGBFillColor(currentContext, 0.0, 0.0, 0.0, 1.0);
        
        NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        paragraphStyle.alignment = NSTextAlignmentLeft;
        
        NSDictionary *attributes = @{ NSFontAttributeName: bigBoldFont,
                                      NSParagraphStyleAttributeName: paragraphStyle };
        
        CGSize maxSize = CGSizeMake(360, pageSize.height - 2*borderInset);
        
        CGRect textSize = [pageLabel boundingRectWithSize:maxSize
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:attributes
                                                context:nil];
        
        pageLabelRect = CGRectMake(
                                 pageNumberRect.origin.x-textSize.size.width-5,
                                 titleRect.origin.y+titleRect.size.height+10,
                                 textSize.size.width,
                                 textSize.size.height);
        
        [pageLabel drawInRect:pageLabelRect withAttributes:attributes];
    }
}

- (void) drawAddress:(NSString*)address {
    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(currentContext, 0.0, 0.0, 0.0, 1.0);

    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.alignment = NSTextAlignmentLeft;

    NSDictionary *attributes = @{ NSFontAttributeName: bigFont,
                                  NSParagraphStyleAttributeName: paragraphStyle };

    CGSize maxSize = CGSizeMake(incidentIdLabelRect.origin.x-borderInset-40, pageSize.height - 2*borderInset);

    CGRect textSize = [address boundingRectWithSize:maxSize
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                            attributes:attributes
                                               context:nil];

    addressRect = CGRectMake(
                          borderInset,
                          titleRect.origin.y+titleRect.size.height+10,
                          textSize.size.width,
                          textSize.size.height);

    [address drawInRect:addressRect withAttributes:attributes];
}

- (void) drawIncidentId:(NSString*)incidentId {
    {//*** incident ID ***
        CGContextRef    currentContext = UIGraphicsGetCurrentContext();
        CGContextSetRGBFillColor(currentContext, 0.0, 0.0, 0.0, 1.0);
        
        NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        paragraphStyle.alignment = NSTextAlignmentLeft;
        
        NSDictionary *attributes = @{ NSFontAttributeName: bigFont,
                                      NSParagraphStyleAttributeName: paragraphStyle };
        
        CGSize maxSize = CGSizeMake(300, 300);
        
        CGRect textSize = [incidentId boundingRectWithSize:maxSize
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                attributes:attributes
                                                   context:nil];
        
        incidentIdRect = CGRectMake(
                                    pageLabelRect.origin.x - textSize.size.width - 40,
                                    titleRect.origin.y+titleRect.size.height+10,
                                    textSize.size.width,
                                    textSize.size.height);
        
        [incidentId drawInRect:incidentIdRect withAttributes:attributes];
    }
    
    {//*** label ***
        NSString* label = @"Incident ID:";
        CGContextRef    currentContext = UIGraphicsGetCurrentContext();
        CGContextSetRGBFillColor(currentContext, 0.0, 0.0, 0.0, 1.0);
        
        NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        paragraphStyle.alignment = NSTextAlignmentLeft;
        
        NSDictionary *attributes = @{ NSFontAttributeName: bigBoldFont,
                                      NSParagraphStyleAttributeName: paragraphStyle };
        
        CGSize maxSize = CGSizeMake(300, 300);
        
        CGRect textSize = [label boundingRectWithSize:maxSize
                                                  options:NSStringDrawingUsesLineFragmentOrigin
                                               attributes:attributes
                                                  context:nil];
        
        incidentIdLabelRect = CGRectMake(
                                   incidentIdRect.origin.x-textSize.size.width-5,
                                   titleRect.origin.y+titleRect.size.height+10,
                                   textSize.size.width,
                                   textSize.size.height);
        
        [label drawInRect:incidentIdLabelRect withAttributes:attributes];
    }
}

- (void) drawHeaderLine {
    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(currentContext, 3.0);
    
    CGContextSetStrokeColorWithColor(currentContext, [UIColor blueColor].CGColor);
    
    CGPoint startPoint = CGPointMake(borderInset, addressRect.origin.y+addressRect.size.height+10);
    CGPoint endPoint = CGPointMake(pageSize.width-borderInset, addressRect.origin.y+addressRect.size.height+10);
    
    CGContextBeginPath(currentContext);
    CGContextMoveToPoint(currentContext, startPoint.x, startPoint.y);
    CGContextAddLineToPoint(currentContext, endPoint.x, endPoint.y);
    
    CGContextClosePath(currentContext);
    CGContextDrawPath(currentContext, kCGPathFillStroke);
}

@end



