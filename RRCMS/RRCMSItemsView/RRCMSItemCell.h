//
//  RRCMSItemCell.h
//  RRCMS
//
//  Created by Ron on 5/5/17.
//  Copyright © 2017 Ron. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RRCMSItemModel;

@interface RRCMSItemCell : UICollectionViewCell

@property (strong, nonatomic) RRCMSItemModel *itemModel;

@end


#pragma mark -

@interface RRCMSItemModel : NSObject

@property (strong, nonatomic) NSString *pageURL;
@property (strong, nonatomic) NSString *imageURL;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *price;

@end
