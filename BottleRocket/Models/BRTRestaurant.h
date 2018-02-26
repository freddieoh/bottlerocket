//
//  BRTRestaurant.h
//  BottleRocket
//
//  Created by Fredrick Ohen on 1/27/18.
//  Copyright © 2018 geeoku. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BRTRestaurant : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *backgroundImageURL;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSString *contact;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *twitter;


- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
