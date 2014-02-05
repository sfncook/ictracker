//
//  SectorTBarDelegate.h
//  Ictracker
//
//  Created by S. Cook on 1/14/14.
//  Copyright (c) 2014 cook. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SectorTBarDelegate <NSObject>

- (void) onSelected:(id)selected;
- (void) onTitleClick:(id)selected;
- (void) onActionClick:(id)selected;
- (void) onUnitClick:(id)selected;
- (void) onActionableUnitClick:(id)selected;
- (void) onPsiClickWithSectorTBar:(id)sectorTBarView;
- (void) onParClickWithSectorTBar:(id)sectorTBarView;

@end
