//
//  RRCMSListCellBannerCell.h
//  RRCMS
//
//  Created by Ron on 4/25/17.
//  Copyright © 2017 Ron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RRCMSListCellBannerCell : UICollectionViewCell
{
    IBOutlet UIImageView *_imageView;
//    IBOutlet UILabel *_testLabel;
}

@property (copy, nonatomic) NSString *imageURLString;

@end
