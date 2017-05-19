//
//  RRStickSegmentCell.m
//  RRCMS
//
//  Created by Ron on 5/18/17.
//  Copyright © 2017 Ron. All rights reserved.
//

#import "RRStickSegmentCell.h"

@interface RRStickSegmentCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation RRStickSegmentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected {
    [self.nameLabel setTextColor: selected ? [UIColor redColor] : [UIColor blackColor]];
}

- (void)setSegmentName:(NSString *)segmentName {
    _segmentName = segmentName;
    [self.nameLabel setText:_segmentName];
}

@end
