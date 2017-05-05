//
//  RRCMSItemsView.m
//  RRCMS
//
//  Created by Ron on 5/5/17.
//  Copyright © 2017 Ron. All rights reserved.
//

#import "RRCMSItemsView.h"
#import "RRCMSItemCell.h"

@interface RRCMSItemsView ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@end

@implementation RRCMSItemsView

static NSString * const itemViewCellIdentifier = @"RRCMSItemCell";

- (instancetype)initWithFrame:(CGRect)frame {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        [self setDelegate:self];
        [self setDataSource:self];
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([RRCMSItemCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:itemViewCellIdentifier];
        
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

- (void)setDataSourceArray:(NSArray *)dataSourceArray {
    _dataSourceArray = dataSourceArray;
    [self reloadData];
}

#pragma mark UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSourceArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RRCMSItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:itemViewCellIdentifier forIndexPath:indexPath];
    RRCMSItemModel *model = [[RRCMSItemModel alloc] init];
    model.pageURL = @"https://www.apple.com/cn";
    model.imageURL = @"https://img.alicdn.com/tps/TB1lfiGMpXXXXXeXFXXXXXXXXXX-200-200.jpg_120x120.jpg";
    model.name = @"大马士革玫瑰纯露Florihana";
    model.price = @"56.00";
    cell.itemModel = model;
    return cell;
}

#pragma mark UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(100, 140);
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 5, 10, 5);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

@end
