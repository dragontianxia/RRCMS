//
//  UIView+YCExtention.h
//  Yit.com
//
//  Created by user on 15/7/2.
//  Copyright (c) 2015年 Yit.com. All rights reserved.
//

#import <UIKit/UIKit.h>

// 绘制1像素的线，需要的宏
#define SINGLE_LINE_HEIGHT          (1 / [UIScreen mainScreen].scale) // 线的高度（宽度）
#define SINGLE_LINE_ADJUST_OFFSET   ((1 / [UIScreen mainScreen].scale) / 2) // 适配不同分辨率需要做的偏移
#define SINGLE_LINE_OFFSET          ((1 / [UIScreen mainScreen].scale) - ((1 / [UIScreen mainScreen].scale) / 2)) // 绘制细线的时候，需要减掉的高度

/// 宽
#define kFBaseWidth [[UIScreen mainScreen]bounds].size.width

/// 高
#define kFBaseHeight [[UIScreen mainScreen]bounds].size.height

@interface UIView (YCExtention)

@property (nonatomic, assign) CGFloat x;

@property (nonatomic, assign) CGFloat y;

@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGFloat right;

@property (nonatomic, assign) CGFloat bottom;

@property (nonatomic, assign) CGPoint origin;

@property (nonatomic, assign) CGSize size;

/// 设置边角弧度
- (void)setCornerRadius:(CGFloat)radius;

/// 设置边线
- (void)setBorderColor:(UIColor *)color width:(CGFloat)width;

- (void)setTapGestureWithBlock:(void(^)())block;

@end
