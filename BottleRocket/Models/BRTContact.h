//
//  BRTContact.h
//  BottleRocket
//
//  Created by Fredrick Ohen on 2/23/18.
//  Copyright © 2018 geeoku. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BRTContact : NSObject

@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *formattedPhone;
@property (nonatomic, strong) NSString *twitter;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;


@end
