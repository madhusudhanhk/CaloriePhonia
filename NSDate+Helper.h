//
//  NSDate+Helper.h
//  CaloriePhonia
//
//  Created by Madhusudhan.HK on 8/13/15.
//  Copyright (c) 2015 Madhusudhan.HK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Helper)
+(NSDateFormatter*)railsDateFormatter;
+(NSDate*)railsDateParse:(NSString*)dateString;
+(NSDate*)today;
+(NSDate*)yesterday;
+(NSDate*)tomorrow;
-(NSDate*)beginningOfWeek;
-(NSDate*)endOfWeek;
-(BOOL)isToday;
-(BOOL)isYesterday;
-(BOOL)isTomorrow;
-(NSString*)relativeDateString:(NSDateFormatter*)formatter;
-(NSString*)railsDateString;
@end
