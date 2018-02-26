//
//  BRTContact.m
//  BottleRocket
//
//  Created by Fredrick Ohen on 2/23/18.
//  Copyright © 2018 geeoku. All rights reserved.
//

#import "BRTContact.h"

@implementation BRTContact

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.phone = dictionary[@"phone"];
        self.formattedPhone = dictionary[@"formattedPhone"];
        self.twitter = dictionary[@"twitter"];
    }
    
    return self;
}


@end
