//
//  RRCMSWaresBaseCell.m
//  RRCMS
//
//  Created by Ron on 5/17/17.
//  Copyright © 2017 Ron. All rights reserved.
//

#import "RRCMSWaresBaseCell.h"
#import <UIImageView+WebCache.h>

@interface RRCMSWaresBaseCell ()

@property (weak, nonatomic) IBOutlet UIImageView *waresImageView;
@property (weak, nonatomic) IBOutlet UILabel *waresNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *waresDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *waresPriceLabel;

@end

@implementation RRCMSWaresBaseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
//    [self setBackgroundColor:[UIColor redColor]];
}

- (void)setItemModel:(RRCMSWaresModel *)itemModel {
    [self.waresImageView sd_setImageWithURL:[NSURL URLWithString:itemModel.imageURL]];
    [self.waresNameLabel setText:[NSString stringWithFormat:@"%@", itemModel.name]];
    [self.waresDescriptionLabel setText:[NSString stringWithFormat:@"%@", itemModel.subtitle]];
    [self.waresPriceLabel setText:[NSString stringWithFormat:@"¥%@", itemModel.price]];
}

@end

@implementation RRCMSWaresModel

@end
