//
//  RRSegmentController.m
//  RRSegmentController
//
//  Created by Ron on 2017/3/22.
//  Copyright © 2017年 Ron. All rights reserved.
//

#import "RRSegmentController.h"
#import "RRSegmentView.h"
#import "RRCMSContentView.h"
#import "RRStickSegmentView.h"

static CGFloat const kSegmentViewHeight = 44;

@interface RRSegmentController ()<RRCMSContentViewDelegate, UIScrollViewDelegate>
{
    CGFloat kScreenWidth, kContentHeight;
}

/// 顶部 segment 数组
@property (strong, nonatomic) NSArray *titleDataSourceArray;
/// 顶部 segment 控件
@property (strong, nonatomic) RRSegmentView *segmentView;

/// 内容 控件
@property (strong, nonatomic) RRCMSContentView *contentCollectionView;
@property (strong, nonatomic) UIScrollView *contentScrollView; //或者选择这个？

@end

@implementation RRSegmentController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    kScreenWidth = [[UIScreen mainScreen] bounds].size.width;
    kContentHeight = self.view.frame.size.height - 64 - kSegmentViewHeight;

//    self.titleDataSourceArray = @[@"首页", @"数码家电", @"服饰美妆", @"图书文创", @"家居生活", @"美食厨房"];
//    [self loadSegmentView];
    
    // @"<#name#>", @"<#name#>", @"<#name#>", @"<#name#>", @"<#name#>", @"<#name#>", @"<#name#>",
    self.titleDataSourceArray = @[
                                  @"首页", @"特惠", @"礼物", @"服饰", @"珠宝", @"美妆", @"洗护",
                                  @"数码", @"家电", @"家居", @"家具", @"器物", @"旅行", @"运动",
                                  @"美食", @"餐厨", @"母婴", @"爱宠", @"图书", @"文房", @"全部",
                                  ];
    [self loadStickSegmentView];
}

- (void)loadStickSegmentView {
    RRStickSegmentView *stickView = [[RRStickSegmentView alloc] initWithFrame:CGRectMake(0, 64, self.view.width, 44 * 3 + 6) dataSourceArray:self.titleDataSourceArray];
    [self.view addSubview:stickView];
}

#pragma mark - SegmentView
- (void)loadSegmentView {
    __weak typeof(self) wSelf = self;
    _segmentView = [[RRSegmentView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, kSegmentViewHeight)
                                             titleArray:self.titleDataSourceArray
                                           itemSelected:^(NSInteger selectedIndex, BOOL animated) {
                                               [wSelf.contentScrollView setContentOffset:CGPointMake(selectedIndex * kScreenWidth, 0) animated:animated];
                                           }];
    [self.view addSubview:_segmentView];
    
    [self loadContentCollectionView];
}

#pragma mark - CollectionView

- (void)loadContentCollectionView {
    self.contentCollectionView = [[RRCMSContentView alloc] initWithFrame:CGRectMake(0, 64 + kSegmentViewHeight, kScreenWidth, kContentHeight) dataSourceArray:self.titleDataSourceArray];
    self.contentCollectionView.cmsDelegate = self;
    [self.view addSubview:self.contentCollectionView];
}

- (void)cmsContentViewScrollOffsetX:(CGFloat)offsetX {
    [_segmentView contentViewScrollOffsetX:offsetX];
}

#pragma mark - ScrollViewDemo

- (void)loadContentScrollView {
    _contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 44, kScreenWidth, kContentHeight)];
    [_contentScrollView setContentSize:CGSizeMake(self.titleDataSourceArray.count * kScreenWidth, kContentHeight)];
    [_contentScrollView setPagingEnabled:YES];
    [_contentScrollView setShowsHorizontalScrollIndicator:NO];
    [_contentScrollView setBackgroundColor:[UIColor yellowColor]];
    
    for (int i = 0; i < self.titleDataSourceArray.count; i++) {
        // Test content
        UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(i * kScreenWidth, 0, kScreenWidth, kContentHeight)];
        [contentLabel setFont:[UIFont systemFontOfSize:50]];
        [contentLabel setText:self.titleDataSourceArray[i]];
        [contentLabel setTextAlignment:NSTextAlignmentCenter];
        
        [contentLabel setBackgroundColor:[UIColor cyanColor]];
        
        [_contentScrollView addSubview:contentLabel];
    }
    
    [self.view addSubview:_contentScrollView];
    [_contentScrollView setDelegate:self];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [_segmentView contentViewScrollOffsetX:scrollView.contentOffset.x];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
