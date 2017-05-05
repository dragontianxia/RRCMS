//
//  RRCMSItemCell.m
//  RRCMS
//
//  Created by Ron on 5/5/17.
//  Copyright © 2017 Ron. All rights reserved.
//

#import "RRCMSItemCell.h"
#import <UIImageView+WebCache.h>

@interface RRCMSItemCell ()

@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (weak, nonatomic) IBOutlet UILabel *itemNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemPriceLabel;

@end

@implementation RRCMSItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setItemModel:(RRCMSItemModel *)itemModel {
    [self.itemImageView sd_setImageWithURL:[NSURL URLWithString:itemModel.imageURL]];
    [self.itemNameLabel setText:[NSString stringWithFormat:@"%@", itemModel.name]];
    [self.itemPriceLabel setText:[NSString stringWithFormat:@"¥%@", itemModel.price]];
}

@end

@implementation RRCMSItemModel

@end
