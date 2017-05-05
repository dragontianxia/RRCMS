//
//  RRCMSListView.m
//  RRCMS
//
//  Created by Ron on 4/25/17.
//  Copyright © 2017 Ron. All rights reserved.
//

#import "RRCMSListView.h"
#import "RRCMSListCellCycleView.h"
//#import "RRCMSListCellBannerView.h"
#import "RRCMSListCellBannerCell.h"
#import "RRCMSCellLayout.h"

@interface RRCMSListView ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (copy, nonatomic) NSArray *dataSourceArray;

@property (strong, nonatomic) NSArray *tempArray;

@end

@implementation RRCMSListView

static NSString * const cellIdentifierCycleView  = @"RRCMSListCellCycleView";
static NSString * const cellIdentifierBannerCell = @"RRCMSListCellBannerCell";

- (instancetype)initWithFrame:(CGRect)frame dataSourceArray:(NSArray *)dataSourceArray {
//    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];

    RRCMSCellLayout *layout = [[RRCMSCellLayout alloc] init];
    
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        if (dataSourceArray != nil && dataSourceArray.count > 0) {
            self.dataSourceArray = dataSourceArray;
        }
        self.tempArray = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493125436778&di=09b8d34b98361c7f5aa6871d15938935&imgtype=0&src=http%3A%2F%2Fimg.sj33.cn%2Fuploads%2Fallimg%2F201302%2F1-130201105055.jpg",
                           @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493125464013&di=25ac898983271986946e4e8631b2602e&imgtype=0&src=http%3A%2F%2Fpic2.ooopic.com%2F12%2F13%2F96%2F42bOOOPICb2_1024.jpg",
                           @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493125487541&di=5d58d9edeaedf5adbc7ebfda9580afea&imgtype=0&src=http%3A%2F%2Fs10.sinaimg.cn%2Fbmiddle%2F51e1c0e3h7191aa69e0a9%26690",
                           @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493125514308&di=51c79a64ee63d400f990a2117aec3b17&imgtype=0&src=http%3A%2F%2Fs9.sinaimg.cn%2Fmw690%2F002Kq7FSgy6SK0Myerm48%26690",
                           @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493125514306&di=4d599a09f929bfc74f0f186286a395c8&imgtype=0&src=http%3A%2F%2Fh8.86.cc%2Fwalls%2F20151103%2F1024x768_0454685ea838a94.jpg",
                           @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493125514306&di=f17a8af0a04bbf41d03ab10643994e20&imgtype=0&src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fwallpaper%2F1307%2F24%2Fc0%2F23715285_1374678431270_800x800.jpg",
                           ];
        
        [self setDelegate:self];
        [self setDataSource:self];
        [self registerClass:[RRCMSListCellCycleView class] forCellWithReuseIdentifier:cellIdentifierCycleView];
        
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([RRCMSListCellBannerCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:cellIdentifierBannerCell];
        
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

#pragma mark UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.dataSourceArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    return self.dataSourceArray.count;
    switch (section) {
        case 0:
            return 1;
        default:
            return section;
//            break;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        RRCMSListCellCycleView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifierCycleView forIndexPath:indexPath];
        cell.dataSourceArray = self.tempArray;
        return cell;
    } else {
        RRCMSListCellBannerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifierBannerCell forIndexPath:indexPath];
//        cell.imageURLString = [NSString stringWithFormat:@"S %ld i %ld", indexPath.section, indexPath.item];
        
        cell.imageURLString = self.tempArray[indexPath.item];
        
//        cell.dataSourceArray = [self.tempArray subarrayWithRange:NSMakeRange(0, indexPath.section)];
        return cell;
    }
}

/*
#pragma mark UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
            return CGSizeMake(375, 200);
            
        case 1:
            return CGSizeMake(375, 200);
            
        case 2:
            return CGSizeMake(150, 200);
            
        case 3:{
            switch (indexPath.item) {
                case 0:
                    return CGSizeMake(150, 200);
                default:
                    return CGSizeMake(150, 80);
            }
        }
            
        default:
            return CGSizeMake(150, 150);
    }
    return CGSizeMake(375, 200);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(40, 0, 10, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 1.0f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 1.0f;
}

 */


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
