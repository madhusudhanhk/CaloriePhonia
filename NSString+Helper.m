//
//  NSString+Helper.m
//  CaloriePhonia
//
//  Created by Madhusudhan.HK on 8/13/15.
//  Copyright (c) 2015 Madhusudhan.HK. All rights reserved.
//

#import "NSString+Helper.h"

@implementation NSString (Helper)

- (BOOL)isEmpty {
    if([self length] == 0) { //string is empty or nil
        return YES;
    }
    
    if(![[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]) {
        //string is all whitespace
        return YES;
    }
    
    return NO;
}

@end
