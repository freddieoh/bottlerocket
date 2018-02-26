//
//  BRTRestaurant.m
//  BottleRocket
//
//  Created by Fredrick Ohen on 1/27/18.
//  Copyright © 2018 geeoku. All rights reserved.
//

#import "BRTRestaurant.h"
#import "BRTContact.h"

@implementation BRTRestaurant

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.name = dictionary[@"name"];
        self.category = dictionary[@"category"];
        self.contact = dictionary[@"contact"];
        self.location = dictionary[@"location"];
        self.backgroundImageURL = dictionary[@"backgroundImageURL"];
        
//        self.contact = [[BRTContact alloc] initWithDictionary:dictionary[@"contact"]];

    }
    
    return self;
}

@end
