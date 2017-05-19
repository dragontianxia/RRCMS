//
//  UIView+YCExtention.h
//  Yit.com
//
//  Created by user on 15/7/2.
//  Copyright (c) 2015年 Yit.com. All rights reserved.
//

#import <UIKit/UIKit.h>

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
- (void) setCornerRadius:(CGFloat)radius;
/// 设置边线
- (void) setBorderColor:(UIColor *)color width:(CGFloat)width;

- (void)setTapGestureWithBlock:(void(^)())block;

@end
