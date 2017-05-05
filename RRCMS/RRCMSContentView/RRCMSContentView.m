//
//  RRCMSContentView.m
//  RRCMS
//
//  Created by Ron on 4/25/17.
//  Copyright © 2017 Ron. All rights reserved.
//

#import "RRCMSContentView.h"
#import "RRCMSContentViewCell.h"

@interface RRCMSContentView ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (copy, nonatomic) NSArray *dataSourceArray;

@end

@implementation RRCMSContentView

static NSString * const contentViewCellIdentifier = @"RRCollectionCell";

- (instancetype)initWithFrame:(CGRect)frame dataSourceArray:(NSArray *)dataSourceArray {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        if (dataSourceArray != nil && dataSourceArray.count > 0) {
            self.dataSourceArray = dataSourceArray;
        }
        [self setPagingEnabled:YES];
        [self setDelegate:self];
        [self setDataSource:self];
        [self registerClass:[RRCMSContentViewCell class] forCellWithReuseIdentifier:contentViewCellIdentifier];
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

#pragma mark UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSourceArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RRCMSContentViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:contentViewCellIdentifier forIndexPath:indexPath];
    cell.dataSourceArray = @[@"xx", @"yy", @"zz", @"xx", @"yy", @"zz"];
    return cell;
}

#pragma mark UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    return CGSizeMake(self.bounds.size.width - 10, self.bounds.size.height);
    return self.bounds.size;
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.cmsDelegate) {
        [self.cmsDelegate cmsContentViewScrollOffsetX:scrollView.contentOffset.x];
    }
}

@end
