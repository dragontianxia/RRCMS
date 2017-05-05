//
//  RRCMSListCellBannerView.h
//  RRCMS
//
//  Created by Ron on 4/25/17.
//  Copyright © 2017 Ron. All rights reserved.
//

#import <UIKit/UIKit.h>

// 根据显示图片数量来分类使用，目前最多是4张图片
typedef enum : NSUInteger {
    RRCMSListBannerTypeOne = 1,
    RRCMSListBannerTypeTwo,
    RRCMSListBannerTypeThree,
    RRCMSListBannerTypeFour
} RRCMSListBannerType;

@interface RRCMSListCellBannerView : UICollectionViewCell

@property (copy, nonatomic) NSArray *dataSourceArray;

@end
