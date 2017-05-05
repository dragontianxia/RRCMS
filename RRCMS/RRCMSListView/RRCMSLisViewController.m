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

@interface RRCMSLisViewController ()

@property (strong, nonatomic) NSArray *tempArray;

@end

@implementation RRCMSLisViewController

//static NSString * const reuseIdentifier = @"Cell";
static NSString * const lisViewCellIdentifierCycleView  = @"RRCMSListCellCycleView";
static NSString * const lisViewCellIdentifierBannerCell = @"RRCMSListCellBannerCell";
static NSString * const lisViewCellIdentifierItemsCell  = @"RRCMSListCellItemsView";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.tempArray = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493125436778&di=09b8d34b98361c7f5aa6871d15938935&imgtype=0&src=http%3A%2F%2Fimg.sj33.cn%2Fuploads%2Fallimg%2F201302%2F1-130201105055.jpg",
                       @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493125464013&di=25ac898983271986946e4e8631b2602e&imgtype=0&src=http%3A%2F%2Fpic2.ooopic.com%2F12%2F13%2F96%2F42bOOOPICb2_1024.jpg",
                       @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493125487541&di=5d58d9edeaedf5adbc7ebfda9580afea&imgtype=0&src=http%3A%2F%2Fs10.sinaimg.cn%2Fbmiddle%2F51e1c0e3h7191aa69e0a9%26690",
                       @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493125514308&di=51c79a64ee63d400f990a2117aec3b17&imgtype=0&src=http%3A%2F%2Fs9.sinaimg.cn%2Fmw690%2F002Kq7FSgy6SK0Myerm48%26690",
                       @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493125514306&di=4d599a09f929bfc74f0f186286a395c8&imgtype=0&src=http%3A%2F%2Fh8.86.cc%2Fwalls%2F20151103%2F1024x768_0454685ea838a94.jpg",
                       @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493125514306&di=f17a8af0a04bbf41d03ab10643994e20&imgtype=0&src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fwallpaper%2F1307%2F24%2Fc0%2F23715285_1374678431270_800x800.jpg",
                       ];
    
//    RRCMSCellLayout *layout = [[RRCMSCellLayout alloc] init];
//    [self.collectionView setCollectionViewLayout:layout animated:YES];
    
    [self.collectionView registerClass:[RRCMSListCellCycleView class] forCellWithReuseIdentifier:lisViewCellIdentifierCycleView];
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([RRCMSListCellBannerCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:lisViewCellIdentifierBannerCell];
    
    [self.collectionView registerClass:[RRCMSListCellItemsView class] forCellWithReuseIdentifier:lisViewCellIdentifierItemsCell];
    
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.dataSourceArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    switch (section) {
        case 0:
        case 1:
            return 1;
        default:
            return section - 1;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        RRCMSListCellCycleView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:lisViewCellIdentifierCycleView forIndexPath:indexPath];
        cell.dataSourceArray = self.tempArray;
        return cell;
    } else if (indexPath.section == 1) {
        RRCMSListCellItemsView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:lisViewCellIdentifierItemsCell forIndexPath:indexPath];
        cell.dataSourceArray = self.tempArray;
        return cell;
    } else {
        RRCMSListCellBannerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:lisViewCellIdentifierBannerCell forIndexPath:indexPath];
        cell.imageURLString = self.tempArray[indexPath.item];
        return cell;
    }
}

#pragma mark <UICollectionViewDelegate>

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
