//
//  BRTRestauranDetailViewController.m
//  BottleRocket
//
//  Created by Fredrick Ohen on 2/8/18.
//  Copyright © 2018 geeoku. All rights reserved.
//

#import "BRTRestaurantDetailViewController.h"
#import "BRTRestaurant.h"

@interface BRTRestaurantDetailViewController ()

@end

@implementation BRTRestaurantDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.restaurantNameLabel.text = self.name;
    self.categoryNameLabel.text = self.category;
    self.twitterLabel.text = self.twitter;
    
    
}

@end
