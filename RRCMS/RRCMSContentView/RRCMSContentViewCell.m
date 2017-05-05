//
//  RRCMSContentViewCell.m
//  RRCMS
//
//  Created by Ron on 4/25/17.
//  Copyright © 2017 Ron. All rights reserved.
//

#import "RRCMSContentViewCell.h"
#import "RRCMSLisViewController.h"
#import "RRCMSListViewLayout.h"

@interface RRCMSContentViewCell ()

@property (strong, nonatomic) RRCMSLisViewController *listVC;

@end

@implementation RRCMSContentViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self loadListView];
    }
    return self;
}

- (void)loadListView {
    self.listVC = [[RRCMSLisViewController alloc] initWithCollectionViewLayout:[[RRCMSListViewLayout alloc] init]];
    [self.contentView addSubview:_listVC.view];
}

- (void)setDataSourceArray:(NSArray *)dataSourceArray {
    _dataSourceArray = dataSourceArray;
    self.listVC.dataSourceArray = dataSourceArray;
}

@end
