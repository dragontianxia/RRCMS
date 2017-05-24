//
//  RRCMSListCellBannerCell.m
//  RRCMS
//
//  Created by Ron on 4/25/17.
//  Copyright © 2017 Ron. All rights reserved.
//

#import "RRCMSListCellBannerCell.h"
#import <UIImageView+WebCache.h>

@implementation RRCMSListCellBannerCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setClipsToBounds:YES];
    
    [self setContentMode:UIViewContentModeScaleToFill];
    
//    [self setBackgroundColor:[UIColor redColor]];
//    
//    [self.contentView setBackgroundColor:[UIColor yellowColor]];
}

- (void)setImageURLString:(NSString *)imageURLString {
//    NSLog(@"cell bounds %@, image bounds %@", NSStringFromCGRect(self.contentView.bounds), NSStringFromCGRect(_imageView.frame));
    _imageURLString = imageURLString;
    NSURL *imageURL = [NSURL URLWithString:imageURLString];
    [_imageView sd_setImageWithURL:imageURL placeholderImage:nil completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
    }];
}

@end
