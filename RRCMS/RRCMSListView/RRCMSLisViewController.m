//
//  RRCMSLisViewController.m
//  RRCMS
//
//  Created by Ron on 5/4/17.
//  Copyright © 2017 Ron. All rights reserved.
//

#import "RRCMSLisViewController.h"
#import "RRCMSListCellCycleView.h"
#import "RRCMSListCellBannerCell.h"
#import "RRCMSListCellItemsView.h"

#import "RRCMSWaresCellVertical.h"
#import "RRCMSWaresCellHorizontal.h"
#import "RRCMSWaresHeader.h"
#import "RRCMSWaresFooter.h"

@interface RRCMSLisViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) NSArray *tempArray;
@property (strong, nonatomic) UICollectionView *collectionView;
@end

@implementation RRCMSLisViewController

//static NSString * const reuseIdentifier = @"Cell";
static NSString * const listViewCellIdentifierCycleView  = @"RRCMSListCellCycleView";
static NSString * const listViewCellIdentifierBannerCell = @"RRCMSListCellBannerCell";
static NSString * const listViewCellIdentifierItemsCell  = @"RRCMSListCellItemsView";
static NSString * const listViewCellIdentifierWaresCellV = @"RRCMSWaresCellVertical";
static NSString * const listViewCellIdentifierWaresCellH = @"RRCMSWaresCellHorizontal";

static CGFloat kItemSpacing = 10.0f;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 44 - 64) collectionViewLayout:layout];
    [self.collectionView setDataSource:self];
    [self.collectionView setDelegate:self];
    [self.view addSubview:self.collectionView];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.tempArray = @[
                       @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493125436778&di=09b8d34b98361c7f5aa6871d15938935&imgtype=0&src=http%3A%2F%2Fimg.sj33.cn%2Fuploads%2Fallimg%2F201302%2F1-130201105055.jpg",
                       @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493125464013&di=25ac898983271986946e4e8631b2602e&imgtype=0&src=http%3A%2F%2Fpic2.ooopic.com%2F12%2F13%2F96%2F42bOOOPICb2_1024.jpg",
                       @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493125487541&di=5d58d9edeaedf5adbc7ebfda9580afea&imgtype=0&src=http%3A%2F%2Fs10.sinaimg.cn%2Fbmiddle%2F51e1c0e3h7191aa69e0a9%26690",
                       @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493125514308&di=51c79a64ee63d400f990a2117aec3b17&imgtype=0&src=http%3A%2F%2Fs9.sinaimg.cn%2Fmw690%2F002Kq7FSgy6SK0Myerm48%26690",
                       @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493125514306&di=4d599a09f929bfc74f0f186286a395c8&imgtype=0&src=http%3A%2F%2Fh8.86.cc%2Fwalls%2F20151103%2F1024x768_0454685ea838a94.jpg",
                       @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493125514306&di=f17a8af0a04bbf41d03ab10643994e20&imgtype=0&src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fwallpaper%2F1307%2F24%2Fc0%2F23715285_1374678431270_800x800.jpg",
                       ];
    
//    RRCMSCellLayout *layout = [[RRCMSCellLayout alloc] init];
//    [self.collectionView setCollectionViewLayout:layout animated:YES];
    // 轮播控件
    [self.collectionView registerClass:[RRCMSListCellCycleView class] forCellWithReuseIdentifier:listViewCellIdentifierCycleView];
    
    // Banner 一张图片
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([RRCMSListCellBannerCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:listViewCellIdentifierBannerCell];
    
    //[UINib nibWithNibName:NSStringFromClass([RRCMSWaresCell class]) bundle:[NSBundle mainBundle]]
    
    // 多行两列
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([RRCMSWaresCellVertical class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:listViewCellIdentifierWaresCellV];
    
//    [[[NSBundle mainBundle] loadNibNamed:[RRCMSWaresCell description] owner:self options:nil] lastObject];
    // 多行一列
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([RRCMSWaresCellHorizontal class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:listViewCellIdentifierWaresCellH];
    
    // 一行多列
    [self.collectionView registerClass:[RRCMSListCellItemsView class] forCellWithReuseIdentifier:listViewCellIdentifierItemsCell];
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([RRCMSWaresHeader class]) bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:@"UICollectionElementKindSectionHeader" withReuseIdentifier:[RRCMSWaresHeader description]];
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([RRCMSWaresFooter class]) bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:@"UICollectionElementKindSectionFooter" withReuseIdentifier:[RRCMSWaresFooter description]];
    
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setDataSourceArray:(NSArray *)dataSourceArray {
    _dataSourceArray = dataSourceArray;
    [self.collectionView reloadData];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.dataSourceArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return (section > 2 ? 6 : 1);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0: {
            RRCMSListCellCycleView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:listViewCellIdentifierCycleView forIndexPath:indexPath];
            cell.dataSourceArray = self.tempArray;
            return cell;
        }
        case 1: {
            RRCMSListCellBannerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:listViewCellIdentifierBannerCell forIndexPath:indexPath];
            cell.imageURLString = self.tempArray[indexPath.item];
            return cell;
        }
            break;
        case 2: {
            RRCMSListCellItemsView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:listViewCellIdentifierItemsCell forIndexPath:indexPath];
            cell.dataSourceArray = self.tempArray;
            return cell;
        }
        case 3: {
            RRCMSWaresCellVertical *cell = [collectionView dequeueReusableCellWithReuseIdentifier:listViewCellIdentifierWaresCellV forIndexPath:indexPath];
            RRCMSWaresModel *model = [[RRCMSWaresModel alloc] init];
            model.pageURL = @"https://www.apple.com/cn";
            model.imageURL = @"https://img.alicdn.com/tps/TB1lfiGMpXXXXXeXFXXXXXXXXXX-200-200.jpg_120x120.jpg";
            model.name = @"哈佛中国史 6册 哈佛大学出版社镇社之宝";
            model.subtitle = @"1966年开始策划，由费正清、崔瑞德主编";
            model.price = @"789.00";
            cell.itemModel = model;
            return cell;
        }
        case 4: {
            RRCMSWaresCellHorizontal *cell = [collectionView dequeueReusableCellWithReuseIdentifier:listViewCellIdentifierWaresCellH forIndexPath:indexPath];
            RRCMSWaresModel *model = [[RRCMSWaresModel alloc] init];
            model.pageURL = @"https://www.apple.com/cn";
            model.imageURL = @"https://img.alicdn.com/tps/TB1lfiGMpXXXXXeXFXXXXXXXXXX-200-200.jpg_120x120.jpg";
            model.name = @"哈佛中国史 6册 哈佛大学出版社镇社之宝";
            model.subtitle = @"1966年开始策划，由费正清、崔瑞德主编";
            model.price = @"789.00";
            cell.itemModel = model;
            return cell;
        }
        default:
            return nil;
            break;
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section < 3) return nil;
    
    if ([kind isEqualToString:@"UICollectionElementKindSectionHeader"]) {
        return [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:[RRCMSWaresHeader description] forIndexPath:indexPath];
    } else {
        return [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:[RRCMSWaresFooter description] forIndexPath:indexPath];
    }
}

#pragma mark - <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat viewWidth = self.collectionView.width; //frame.size.width;
    CGFloat sectionHeight = 200;
    switch (indexPath.section) {
        case 3:
            return CGSizeMake((viewWidth - kItemSpacing * 3) / 2, 310);
        case 4:
            return CGSizeMake(viewWidth - 20, 120);
        default:
            return CGSizeMake(viewWidth, sectionHeight);
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(kItemSpacing, kItemSpacing, kItemSpacing, kItemSpacing);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return kItemSpacing;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return kItemSpacing;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (section > 2) {
        return CGSizeMake(collectionView.bounds.size.width, 44);
    } else {
        return CGSizeZero;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    if (section > 2) {
        return CGSizeMake(collectionView.bounds.size.width, 44);
    } else {
        return CGSizeZero;
    }
}

#pragma mark - <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"didSelectItemAtIndexPath : %@", indexPath);
}

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
