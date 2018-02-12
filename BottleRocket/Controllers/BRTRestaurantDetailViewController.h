//
//  BRTRestauranDetailViewController.h
//  BottleRocket
//
//  Created by Fredrick Ohen on 2/8/18.
//  Copyright © 2018 geeoku. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BRTRestaurant.h"


@interface BRTRestaurantDetailViewController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *restaurantNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *categoryNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *phoneNumberLabel;
@property (nonatomic, weak) IBOutlet UILabel *twitterLabel;
@property (nonatomic, weak) IBOutlet UILabel *addressLabel;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *twitter;


@property (nonatomic, strong) BRTRestaurant *restaurant;



@end
