//
//  RRStickSegmentSingleRowLayout.m
//  RRCMS
//
//  Created by Ron on 5/22/17.
//  Copyright © 2017 Ron. All rights reserved.
//

#import "RRStickSegmentSingleRowLayout.h"

@implementation RRStickSegmentSingleRowLayout

- (instancetype)init {
    if (self = [super init]) {
        [self setItemSize:CGSizeMake(kFBaseWidth / 7, 44)];
        [self setSectionInset:UIEdgeInsetsMake(0, 0, 2, 0)];
        [self setMinimumLineSpacing:0];
        [self setMinimumInteritemSpacing:0];
        [self setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    }
    return self;
}

@end
