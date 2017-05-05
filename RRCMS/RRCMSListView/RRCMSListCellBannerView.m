//
//  RRCMSListCellBannerView.m
//  RRCMS
//
//  Created by Ron on 4/25/17.
//  Copyright © 2017 Ron. All rights reserved.
//

#import "RRCMSListCellBannerView.h"
#import "RRCMSListCellBannerCell.h"

@interface RRCMSListCellBannerView ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (assign, nonatomic) RRCMSListBannerType bannerType;
/// 用于展示多图
@property (strong, nonatomic) UICollectionView *imageCollectionView;

@end

@implementation RRCMSListCellBannerView

static NSString * const acellIdentifierBannerCell = @"RRCMSListCellBannerCell";

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self loadBannerView];
    }
    return self;
}

- (void)loadBannerView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    self.imageCollectionView = [[UICollectionView alloc] initWithFrame:self.contentView.bounds collectionViewLayout:layout];
    
    [self.imageCollectionView registerClass:[RRCMSListCellBannerCell class] forCellWithReuseIdentifier:acellIdentifierBannerCell];
    [self.imageCollectionView setDataSource:self];
    [self.imageCollectionView setDelegate:self];
    
    [self.contentView addSubview:self.imageCollectionView];
}

- (void)setDataSourceArray:(NSArray *)dataSourceArray {
    _dataSourceArray = dataSourceArray;
    self.bannerType = dataSourceArray.count;
    [self.imageCollectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.bannerType;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RRCMSListCellBannerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:acellIdentifierBannerCell forIndexPath:indexPath];
    cell.imageURLString = self.dataSourceArray[indexPath.item];
    return cell;
}

#pragma mark -
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (_bannerType) {
        case RRCMSListBannerTypeOne:
            return CGSizeMake(375, 200);
        
        case RRCMSListBannerTypeTwo:
            return CGSizeMake(150, 200);
        
        case RRCMSListBannerTypeThree:
            switch (indexPath.item) {
                case 0:
                    return CGSizeMake(150, 200);
                default:
                    return CGSizeMake(150, 80);
            }
        default:
            return CGSizeMake(150, 150);
    }
}

@end
