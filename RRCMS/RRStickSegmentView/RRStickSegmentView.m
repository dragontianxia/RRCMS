//
//  RRStickSegmentView.m
//  RRCMS
//
//  Created by Ron on 5/17/17.
//  Copyright © 2017 Ron. All rights reserved.
//

#import "RRStickSegmentView.h"
#import "RRStickSegmentCell.h"
#import "RRStickSegmentMultiRowLayout.h"
#import "RRStickSegmentSingleRowLayout.h"

@interface RRStickSegmentView ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
{
    CGFloat _itemWidth, _itemHeight, _itemSpacing, _itemRowHeight;
    NSUInteger _itemCount, _itemColumns, _itemRows;
    BOOL _isProcessing;
}

@property (nonatomic, copy) RRStickSegmentViewHandler segmentHandler;

@property (nonatomic, copy) NSArray *dataSourceArray;

@property (nonatomic, strong) UICollectionView *segmentCollectionView;
@property (nonatomic, strong) UIView *firstLineView, *indicateLineView;
@property (nonatomic, strong) UILabel *titleLabel;      // 展示
@property (nonatomic, strong) UIButton *expandButton;   // 展开按钮

@property (nonatomic, strong) RRStickSegmentMultiRowLayout *multiRowLayout;
@property (nonatomic, strong) RRStickSegmentSingleRowLayout *singleRowLayout;

@property (nonatomic, strong) NSIndexPath *selectedIndexPath;

@end

@implementation RRStickSegmentView

static NSString * const segmentViewCellIdentifier = @"RRStickSegmentCell";

- (instancetype)initWithFrame:(CGRect)frame dataSourceArray:(NSArray *)dataSourceArray itemSelected:(RRStickSegmentViewHandler)handler {
    if (self = [super initWithFrame:frame]) {
        
        [self setBackgroundColor:[UIColor colorWithWhite:0.5 alpha:0.5]];
        
        if (dataSourceArray != nil && dataSourceArray.count > 0) {
            self.dataSourceArray = dataSourceArray;
        }
        if (handler) {
            _segmentHandler = handler;
        }
        _itemCount = self.dataSourceArray.count;
        _itemColumns = 7;
        _itemRows = (self.dataSourceArray.count / _itemColumns) + (self.dataSourceArray.count % _itemColumns > 0 ? 1 : 0);
        
        _itemWidth = self.width / _itemColumns;
        _itemHeight = 44.0f;
        _itemSpacing = 2.0f;
        _itemRowHeight = _itemHeight + _itemSpacing;
        
        [self loadTitleLabel];
        [self loadCollectionView];
    }
    return self;
}

- (void)loadTitleLabel {
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.width, _itemRowHeight)];
    [self.titleLabel setBackgroundColor:[UIColor whiteColor]];
    [self.titleLabel setText:@"   全部选项"];
    [self.titleLabel setFont:[UIFont systemFontOfSize:18]];
    [self addSubview:self.titleLabel];
    
    [self loadExpandButton];
}

- (void)loadExpandButton {
    self.expandButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.expandButton setFrame:CGRectMake(self.width - _itemWidth, 0, _itemWidth, _itemRowHeight)];
    [self.expandButton setBackgroundColor:[UIColor whiteColor]];
    [self.expandButton setImage:[UIImage imageNamed:@"arrowDown"] forState:UIControlStateNormal];
    [self.expandButton setImage:[UIImage imageNamed:@"arrowUp"] forState:UIControlStateSelected];
    [self.expandButton addTarget:self action:@selector(onClickExpandButton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.expandButton];
    
    [self loadSeparatorLineView];
}

- (void)loadSeparatorLineView {
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, _itemRowHeight - _itemSpacing / 2, self.width, _itemSpacing / 2)];
    [lineView setBackgroundColor:[UIColor lightGrayColor]];
    [self addSubview:lineView];
}

- (void)loadCollectionView {
    self.multiRowLayout = [[RRStickSegmentMultiRowLayout alloc] init];
    self.singleRowLayout = [[RRStickSegmentSingleRowLayout alloc] init];
    
//    self.segmentCollectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:self.multiRowLayout];
    self.segmentCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.width - _itemWidth, _itemRowHeight) collectionViewLayout:self.singleRowLayout];

    [self.segmentCollectionView setShowsVerticalScrollIndicator:NO];
    [self.segmentCollectionView setShowsHorizontalScrollIndicator:NO];
    [self.segmentCollectionView setDelegate:self];
    [self.segmentCollectionView setDataSource:self];
    [self.segmentCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([RRStickSegmentCell class]) bundle:nil] forCellWithReuseIdentifier:segmentViewCellIdentifier];
    [self.segmentCollectionView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:self.segmentCollectionView];
    
    [self loadCollectionSeparatorLineView];
}

- (void)loadCollectionSeparatorLineView {
    for (int i = 1; i < _itemRows + 1; i++) {
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, i * (_itemRowHeight) - _itemSpacing / 2, self.width, _itemSpacing / 2)];
        [lineView setBackgroundColor:[UIColor lightGrayColor]];
        if (i == 1) {
            self.firstLineView = lineView;
            [self.firstLineView setWidth:_itemWidth * _itemCount * 2];
            [self.firstLineView setX:- _itemWidth * _itemCount / 2];
        }
        [self.segmentCollectionView addSubview:lineView];
    }
    [self loadIndicateLineView];
}

- (void)loadIndicateLineView {
    self.indicateLineView = [[UIView alloc] initWithFrame:CGRectMake(0, _itemHeight, _itemWidth, _itemSpacing)];
    [self.indicateLineView setBackgroundColor:[UIColor redColor]];
    [self.segmentCollectionView addSubview:_indicateLineView];
}

- (void)changeCollectionViewLayout {
    UICollectionViewFlowLayout *layout;
    if (self.segmentCollectionView.collectionViewLayout == self.multiRowLayout) {
        [self setHeight:_itemRowHeight];
        [self.segmentCollectionView setFrame:CGRectMake(0, 0, self.width - _itemWidth, _itemRowHeight)];
        layout = self.singleRowLayout;
    } else {
        [self setHeight:kFBaseHeight];
        [self.segmentCollectionView setFrame:CGRectMake(0, _itemRowHeight, self.width, _itemRowHeight * _itemRows)];
        layout = self.multiRowLayout;
    }
    
    __weak typeof(self) wSelf = self;
    [self.segmentCollectionView.collectionViewLayout invalidateLayout];
    
    [self.segmentCollectionView setCollectionViewLayout:layout animated:NO completion:^(BOOL finished) {
        RRStickSegmentCell *cell = (RRStickSegmentCell *)[wSelf.segmentCollectionView cellForItemAtIndexPath:wSelf.selectedIndexPath];
        [wSelf.indicateLineView setOrigin:CGPointMake(cell.x, cell.y + _itemHeight)];
    }];
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSourceArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RRStickSegmentCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:segmentViewCellIdentifier forIndexPath:indexPath];
    cell.segmentName = self.dataSourceArray[indexPath.item];
    if (indexPath.item == 0 && !self.selectedIndexPath) {
        self.selectedIndexPath = indexPath;
        __weak typeof(self) wSelf = self;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [wSelf.segmentCollectionView selectItemAtIndexPath:wSelf.selectedIndexPath animated:YES scrollPosition:0];
        });
    }
    return cell;
}

#pragma mark - <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath == self.selectedIndexPath) return;
    
    self.selectedIndexPath = indexPath;
    if (collectionView.collectionViewLayout == self.multiRowLayout) {
        [self onClickExpandButton];
    }

    RRStickSegmentCell *cell = (RRStickSegmentCell *)[collectionView cellForItemAtIndexPath:indexPath];
    _isProcessing = YES;
    [collectionView scrollToItemAtIndexPath:self.selectedIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    [UIView animateWithDuration:0.28
                     animations:^{
                         [self.indicateLineView setOrigin:CGPointMake(cell.x, cell.y + _itemHeight)];
                     } completion:^(BOOL finished) {
                         if (finished) {
                             _isProcessing = NO;
                         }
                     }];
    if (self.segmentHandler) {
        self.segmentHandler(indexPath.item);
    }
}

#pragma mark - <ContentViewScroll>
- (void)contentViewScrollOffsetX:(CGFloat)offsetX {
    if (_isProcessing) {
        return;
    }
    CGFloat newX = offsetX / self.width * _itemWidth;
    
    [self.indicateLineView setX:newX];
    
    CGFloat oldX = self.selectedIndexPath.item * _itemWidth;
    
    if (newX >= oldX + _itemWidth || newX <= oldX - _itemWidth) {
        NSUInteger newIndex = (int)(newX / _itemWidth);
        self.selectedIndexPath = [NSIndexPath indexPathForItem:newIndex inSection:0];
        [self.segmentCollectionView selectItemAtIndexPath:self.selectedIndexPath animated:NO scrollPosition:0];
        [self.segmentCollectionView scrollToItemAtIndexPath:self.selectedIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }
}

#pragma mark - <Events>

- (void)onClickExpandButton {
    [self changeCollectionViewLayout];
    [self.expandButton setSelected:!self.expandButton.isSelected];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self onClickExpandButton];
}

@end
