//
//  UIColor+helpers.m
//  CaloriePhonia
//
//  Created by Madhusudhan.HK on 8/13/15.
//  Copyright (c) 2015 Madhusudhan.HK. All rights reserved.
//
#import "UIColor+Helper.h"

@implementation UIColor (Helper)
+(UIColor*)r:(NSInteger)r g:(NSInteger)g b:(NSInteger)b a:(float)a{
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a];
}
@end
