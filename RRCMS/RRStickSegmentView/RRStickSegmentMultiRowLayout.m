//
//  RRStickSegmentMultiRowLayout.m
//  RRCMS
//
//  Created by Ron on 5/22/17.
//  Copyright © 2017 Ron. All rights reserved.
//

#import "RRStickSegmentMultiRowLayout.h"

@implementation RRStickSegmentMultiRowLayout

- (instancetype)init {
    if (self = [super init]) {
        [self setItemSize:CGSizeMake(kFBaseWidth / 7, 44)];
        [self setSectionInset:UIEdgeInsetsMake(0, 0, 0, 0)];
        [self setMinimumLineSpacing:2];
        [self setMinimumInteritemSpacing:0];
        [self setScrollDirection:UICollectionViewScrollDirectionVertical];
    }
    return self;
}

@end
