//
//  RRCMSWaresBaseCell.h
//  RRCMS
//
//  Created by Ron on 5/17/17.
//  Copyright © 2017 Ron. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RRCMSWaresModel;

@interface RRCMSWaresBaseCell : UICollectionViewCell

@property (strong, nonatomic) RRCMSWaresModel *itemModel;

@end

#pragma mark -

@interface RRCMSWaresModel : NSObject

@property (strong, nonatomic) NSString *pageURL;
@property (strong, nonatomic) NSString *imageURL;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *subtitle;
@property (strong, nonatomic) NSString *price;

@end
