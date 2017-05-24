//
//  RRStickSegmentView.h
//  RRCMS
//
//  Created by Ron on 5/17/17.
//  Copyright © 2017 Ron. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^RRStickSegmentViewHandler)(NSInteger selectedIndex);

@interface RRStickSegmentView : UIView

- (instancetype)initWithFrame:(CGRect)frame dataSourceArray:(NSArray *)dataSourceArray itemSelected:(RRStickSegmentViewHandler)handler;

//- (void)onClickExpandButton;

- (void)contentViewScrollOffsetX:(CGFloat)offsetX;

@end
