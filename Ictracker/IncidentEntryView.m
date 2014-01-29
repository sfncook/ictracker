//
//  IncidentEntryView.m
//  Ictracker
//
//  Created by S. Cook on 1/28/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import "IncidentEntryView.h"
#import "Utils.h"

@implementation IncidentEntryView

- (id)initWithDelegate:(id<IncidentEntryDelegate>)delegate
{
    self = [super initWithFrame:CGRectMake(0, 0, [Utils windowHeight], [Utils windowWidth])];
    if (self) {
        _delegate = delegate;
        self.backgroundColor = [UIColor colorWithRed:0.05 green:0.05 blue:0.05 alpha:0.8];
        
        
        _addressField = [[IctTextField alloc] initWithPlaceholder:@"[enter address here]"];
        [_addressField setPosition:CGPointMake(
                                               [Utils windowHeight]/2-_addressField.frame.size.width/2,
                                               [Utils millimetersToPixels:25])];
        _addressField.delegate = self;
        
        _incidentIdField = [[IctTextField alloc] initWithPlaceholder:@"[enter incident ID here]"];
        [_incidentIdField setPosition:CGPointMake(
                                                  [Utils windowHeight]/2-_incidentIdField.frame.size.width/2,
                                                  [Utils millimetersToPixels:50])];
        _incidentIdField.delegate = self;
        
        _goButton = [[ButtonView alloc] initWithName:@"GO" delegate:self size:BUTTON_LARGE];
        [_goButton setPosition:CGPointMake(
                                           [Utils windowHeight]/2-_goButton.frame.size.width/2,
                                           [Utils millimetersToPixels:65])];
        
        UILabel* addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(
                                                                          _addressField.frame.origin.x,
                                                                          _addressField.frame.origin.y-[Utils millimetersToPixels:9],
                                                                          200,
                                                                          60)];
        [addressLabel setText:@"Address:"];
        addressLabel.font = [UIFont systemFontOfSize:30];
        [addressLabel setTextColor:[UIColor whiteColor]];
        
        UILabel* incidentIdLabel = [[UILabel alloc] initWithFrame:CGRectMake(
                                                                          _incidentIdField.frame.origin.x,
                                                                          _incidentIdField.frame.origin.y-[Utils millimetersToPixels:9],
                                                                          200,
                                                                          60)];
        [incidentIdLabel setText:@"Incident ID:"];
        incidentIdLabel.font = [UIFont systemFontOfSize:30];
        [incidentIdLabel setTextColor:[UIColor whiteColor]];
        
        [self addSubview:_addressField];
        [self addSubview:_incidentIdField];
        [self addSubview:_goButton];
        [self addSubview:addressLabel];
        [self addSubview:incidentIdLabel];
        
    }
    return self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (void) click:(id)selector {
    
}

@end
