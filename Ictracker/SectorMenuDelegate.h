//
//  SectorMenuDelegate.h
//  Ictracker
//
//  Created by S. Cook on 1/14/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SectorMenuDelegate <NSObject>

- (void) onClickSector:(NSString*)sectorTitle;

@end
