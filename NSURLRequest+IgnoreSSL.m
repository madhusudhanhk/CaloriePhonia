//
//  NSURLRequest+IgnoreSSL.m
//  CaloriePhonia
//
//  Created by Madhusudhan.HK on 8/13/15.
//  Copyright (c) 2015 Madhusudhan.HK. All rights reserved.
//

#import "NSURLRequest+IgnoreSSL.h"

@implementation NSURLRequest (IgnoreSSL)
+ (BOOL)allowsAnyHTTPSCertificateForHost:(NSString *)host
{
    return YES;
}

@end
    