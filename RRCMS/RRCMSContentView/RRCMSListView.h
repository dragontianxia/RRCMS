//
//  RRCMSListView.h
//  RRCMS
//
//  Created by Ron on 4/25/17.
//  Copyright © 2017 Ron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RRCMSListView : UICollectionView

- (instancetype)initWithFrame:(CGRect)frame dataSourceArray:(NSArray *)dataSourceArray;

@end
