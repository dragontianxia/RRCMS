//
//  RRCMSListViewLayout.m
//  RRCMS
//
//  Created by Ron on 4/26/17.
//  Copyright © 2017 Ron. All rights reserved.
//

#import "RRCMSListViewLayout.h"

@interface RRCMSListViewLayout ()

@property (strong, nonatomic) NSMutableArray *attrsArray;

@end

@implementation RRCMSListViewLayout

///1. 为 layout 显示做准备工作，可以在此设置一些属性
- (void)prepareLayout {
    [super prepareLayout];
    // 清空item布局属性数组
    [self.attrsArray removeAllObjects];
    // 计算item的attrs
    NSUInteger sectionCount = [self.collectionView numberOfSections];
    for (int section = 0; section < sectionCount; section++) {
        NSUInteger itemCount = [self.collectionView numberOfItemsInSection:section];
        for (int item = 0; item < itemCount; item++) {
            @autoreleasepool { // 如果item数目过大容易造成内存峰值提高
                UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:item inSection:section]];
                [self.attrsArray addObject:attrs];
            }
        }
    }
}

- (NSMutableArray *)attrsArray {
    if (_attrsArray == nil) {
        _attrsArray = [NSMutableArray array];
    }
    return _attrsArray;
}


///2. 返回 layout 的 size
- (CGSize)collectionViewContentSize {
    return CGSizeMake(self.collectionView.bounds.size.width, [self.collectionView numberOfSections] * 240  + 100);
}

///3. 返回在 collectionView 的可见范围内所有 item 对应的 layoutAttributes 对象数组。
/// collectionView 的每一个 item 都对应一个 UICollectionViewLayoutAttributes 类型的对象来表示该 item 的一些属性
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return self.attrsArray;
}

/// 根据 indexPath 返回对应的 layoutAttributes 对象
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    CGFloat viewWidth = self.collectionView.frame.size.width;
    CGFloat halfViewWidth = viewWidth / 2;
    CGFloat sectionHeight = 200;
    CGFloat halfHeight = sectionHeight / 2;
    
    switch (indexPath.section) {
        case 0:
            attrs.frame = CGRectMake(0, 0, viewWidth, sectionHeight);
            break;
        case 1:
            attrs.frame = CGRectMake(0, indexPath.section * (sectionHeight + 40) + 0, viewWidth, sectionHeight);
            break;
        case 2:
            attrs.frame = CGRectMake(indexPath.item * halfViewWidth, indexPath.section * (sectionHeight + 40) + 0, halfViewWidth, sectionHeight);
            break;
        case 3:
            switch (indexPath.item) {
                case 0:
                    attrs.frame = CGRectMake(indexPath.item * halfViewWidth, indexPath.section * (sectionHeight + 40) + 0, halfViewWidth, sectionHeight);
                    break;
                default:
                    attrs.frame = CGRectMake(halfViewWidth, indexPath.section * (sectionHeight + 40) + (indexPath.item - 1) * halfHeight, halfViewWidth, halfHeight);
                    break;
            }
            break;
//        case 4:
//            attrs.frame = CGRectMake(0, 0, viewWidth, 200);
//            break;
        default:
            attrs.frame = CGRectMake((indexPath.item % 2) * halfViewWidth, indexPath.section * (sectionHeight + 40) + indexPath.item / 2 * halfHeight, halfViewWidth, halfHeight);
            break;
    }
    /*
    // 开始计算item的x, y, width, height
    CGFloat collectionViewWidth = self.collectionView.frame.size.width;
    
    CGFloat width = (collectionViewWidth - [self edgeInsets].left - [self edgeInsets].right - ([self columnCount] - 1) * [self columnMargin]) / [self columnCount];
    
    // 计算当前item应该摆放在第几列(计算哪一列高度最短)
    __block NSUInteger minColumn = 0; // 默认是第0列
    __block CGFloat minHeight = MAXFLOAT;
    [self.columnHeights enumerateObjectsUsingBlock:^(NSNumber  *_Nonnull heightNumber, NSUInteger idx, BOOL * _Nonnull stop) { // 遍历找出最小高度的列
        
        CGFloat height = [heightNumber doubleValue];
        
        if (minHeight > height) {
            minHeight = height;
            minColumn = idx;
        }
    }];
    
    
    CGFloat x = [self edgeInsets].left + minColumn * ([self columnMargin] + width);
    CGFloat y = minHeight + [self rowMargin];
    
    
    CGFloat height = [self.delegate waterFallLayout:self heightForItemAtIndex:indexPath.item width:width];
    
    attrs.frame = CGRectMake(x, y, width, height);
    
    // 更新数组中的最短列的高度
    self.columnHeights[minColumn] = @(y + height);
    */
    
    return attrs;

}

/*
/// 当 layout 的布局发生变动时，是否重写加载该 layout。默认为 NO，如返回 YES，则重新执行方法 1. & 3.
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    
}

/// 返回 layout ‘最终’ 偏移量，真正停止时的偏移量
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    
}
 */
/*
 - (void)prepareLayout;为layout显示做准备工作，你可以在该方法里设置一些属性。
 - (CGSize)collectionViewContentSize;返回layout的size。
 - (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect;返回在collectionView的可见范围内(bounds)所有item对应的layoutAttrure对象装成的数组。collectionView的每个item都对应一个专门的UICollectionViewLayoutAttributes类型的对象来表示该item的一些属性，比如bounds,size,transform,alpha等。
 - (UICollectionViewLayoutAttributes )layoutAttributesForItemAtIndexPath:(NSIndexPath )indexPath;传入indexPath，返回该indexPath对应的layoutAtture对象。
 - (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds; 当当前layout的布局发生变动时，是否重写加载该layout。默认返回NO，若返回YES，则重新执行这俩方法：
 - (void)prepareLayout;
 - (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect;
 - (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity;返回layout“最终”的偏移量，何谓“最终”，手指离开屏幕时layout的偏移量不是最终的，因为它有惯性，当它停止时才是“最终”偏移量。
 下面这两个方法一般用于自定义插入删除时的动画，后面再说。
 
 - (UICollectionViewLayoutAttributes )initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath )itemIndexPath;
 
 - (nullable UICollectionViewLayoutAttributes )finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath )itemIndexPath;
 */

@end
