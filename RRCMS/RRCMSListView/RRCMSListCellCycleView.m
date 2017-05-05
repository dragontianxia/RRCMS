//
//  RRCMSListCellCycleView.m
//  RRCMS
//
//  Created by Ron on 4/25/17.
//  Copyright © 2017 Ron. All rights reserved.
//  轮播控件

#import "RRCMSListCellCycleView.h"
#import <SDCycleScrollView/SDCycleScrollView.h>

@interface RRCMSListCellCycleView ()<SDCycleScrollViewDelegate>

@property (strong, nonatomic) SDCycleScrollView *cycleView;

@end

@implementation RRCMSListCellCycleView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self loadCycleView];
    }
    return self;
}

- (void)loadCycleView {
    self.cycleView = [SDCycleScrollView cycleScrollViewWithFrame:self.bounds delegate:self placeholderImage:nil];
    self.cycleView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    self.cycleView.pageDotColor = [UIColor whiteColor];
    self.cycleView.currentPageDotColor = [UIColor redColor];
    [self addSubview:self.cycleView];
}

- (void)setDataSourceArray:(NSArray *)dataSourceArray {
    _dataSourceArray = dataSourceArray;
    self.cycleView.imageURLStringsGroup = dataSourceArray;
}

#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    
}

@end
