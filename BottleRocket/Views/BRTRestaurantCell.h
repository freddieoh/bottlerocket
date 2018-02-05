//
//  BRTRestaurantCell.h
//  BottleRocket
//
//  Created by Fredrick Ohen on 1/27/18.
//  Copyright © 2018 geeoku. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BRTRestaurantCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UILabel *restaurantNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *categoryLabel;
@property (nonatomic, weak) IBOutlet UIImageView *restaurantImageView;

@end
