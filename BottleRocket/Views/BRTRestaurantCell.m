//
//  BRTRestaurantCell.m
//  BottleRocket
//
//  Created by Fredrick Ohen on 1/27/18.
//  Copyright © 2018 geeoku. All rights reserved.
//

#import "BRTRestaurantCell.h"

@implementation BRTRestaurantCell


-(void)setValue:(id)value forKey:(NSString *)key{
    NSLog (@"Key is: %@ and Value is: %@",key,value);
    [super setValue:value forKey:key];
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog (@"We've got an undefined Key: %@ and Value is: %@",key,value);
    return;
}



@end
