//
//  RRCMSListCellItemsView.m
//  RRCMS
//
//  Created by Ron on 5/5/17.
//  Copyright © 2017 Ron. All rights reserved.
//

#import "RRCMSListCellItemsView.h"
#import "RRCMSItemsView.h"

@interface RRCMSListCellItemsView ()

@property (strong, nonatomic) RRCMSItemsView *itemsView;

@end

@implementation RRCMSListCellItemsView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self loadItemsView];
    }
    return self;
}

- (void)loadItemsView {
    self.itemsView = [[RRCMSItemsView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    [self addSubview:self.itemsView];
}

- (void)setDataSourceArray:(NSArray *)dataSourceArray {
    _dataSourceArray = dataSourceArray;
    self.itemsView.dataSourceArray = dataSourceArray;
}

@end
