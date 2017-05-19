//
//  RRStickSegmentView.m
//  RRCMS
//
//  Created by Ron on 5/17/17.
//  Copyright © 2017 Ron. All rights reserved.
//

#import "RRStickSegmentView.h"
#import "RRStickSegmentCell.h"

@interface RRStickSegmentView ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
{
    CGFloat _itemWidth, _itemHeight, _itemSpacing;
}
@property (copy, nonatomic) NSArray *dataSourceArray;

@property (strong, nonatomic) UICollectionView *segmentCollectionView;

@property (strong, nonatomic) UIView *indicateLineView;

@end

@implementation RRStickSegmentView

static NSString * const segmentViewCellIdentifier = @"RRStickSegmentCell";
static CGFloat _itemSpacing = 2.0f;

- (instancetype)initWithFrame:(CGRect)frame dataSourceArray:(NSArray *)dataSourceArray {
    if (self = [super initWithFrame:frame]) {
        if (dataSourceArray != nil && dataSourceArray.count > 0) {
            self.dataSourceArray = dataSourceArray;
        }
        _itemWidth = self.width / 7;
        _itemHeight = 44.0f;
        _itemSpacing = 2.0f;
        [self loadCollectionView];
    }
    return self;
}

- (void)loadCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    self.segmentCollectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
    
    [self.segmentCollectionView setPagingEnabled:YES];
    [self.segmentCollectionView setDelegate:self];
    [self.segmentCollectionView setDataSource:self];
    [self.segmentCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([RRStickSegmentCell class]) bundle:nil] forCellWithReuseIdentifier:segmentViewCellIdentifier];
    [self.segmentCollectionView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:self.segmentCollectionView];
    
    [self loadSeparatorLineView];
}

- (void)loadSeparatorLineView {
    for (int i = 1; i < 4; i++) {
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, i * (_itemHeight + _itemSpacing) - _itemSpacing / 2, self.width, _itemSpacing / 2)];
        [lineView setBackgroundColor:[UIColor lightGrayColor]];
        [self.segmentCollectionView addSubview:lineView];
    }
    [self loadIndicateLineView];
}

- (void)loadIndicateLineView {
    self.indicateLineView = [[UIView alloc] initWithFrame:CGRectMake(0, _itemHeight, _itemWidth, _itemSpacing)];
    [self.indicateLineView setBackgroundColor:[UIColor redColor]];
    [self.segmentCollectionView addSubview:_indicateLineView];
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSourceArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RRStickSegmentCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:segmentViewCellIdentifier forIndexPath:indexPath];
    cell.segmentName = self.dataSourceArray[indexPath.item];
    return cell;
}

#pragma mark - <UICollectionViewDelegateFlowLayout>
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(_itemWidth, _itemHeight);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, _itemSpacing, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return _itemSpacing;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

#pragma mark - <>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    RRStickSegmentCell *cell = (RRStickSegmentCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [self.indicateLineView setOrigin:CGPointMake(cell.x, cell.y + _itemHeight)];
}

/*
 - (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;
 - (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section;
 - (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section;
 - (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;
 - (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section;
 */

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
