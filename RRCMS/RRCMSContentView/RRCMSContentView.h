//
//  RRCMSContentView.h
//  RRCMS
//
//  Created by Ron on 4/25/17.
//  Copyright © 2017 Ron. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RRCMSContentViewDelegate <NSObject>

- (void)cmsContentViewScrollOffsetX:(CGFloat)offsetX;

@end

@interface RRCMSContentView : UICollectionView

@property (weak, nonatomic) id<RRCMSContentViewDelegate> cmsDelegate;

/**
 初始化方法
 @param frame 一般为 view.bounds
 @param dataSourceArray 数据源
 */
- (instancetype)initWithFrame:(CGRect)frame dataSourceArray:(NSArray *)dataSourceArray;

@end
