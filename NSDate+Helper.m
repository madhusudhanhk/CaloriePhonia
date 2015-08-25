//
//  NSDate+Helper.m
//  CaloriePhonia
//
//  Created by Madhusudhan.HK on 8/13/15.
//  Copyright (c) 2015 Madhusudhan.HK. All rights reserved.
//

#import "NSDate+Helper.h"

@implementation NSDate (Helper)

+(NSDateFormatter*)railsDateFormatter
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    [formatter setLocale:locale];
    return formatter;
}

+(NSDate*)railsDateParse:(NSString*)dateString
{
    if (!dateString) return nil;
    if ([dateString hasSuffix:@"Z"]) {
        dateString = [[dateString substringToIndex:(dateString.length-1)] stringByAppendingString:@"-0000"];
    }else{
        // iOS can't parse ISO 8601 directly
        // the offset must be -hhmm or GMT-hh:mm not -hh:mm
        // http://stackoverflow.com/questions/7925038/why-nsdateformatter-can-not-parse-date-from-iso-8601-format
        // this code just removes the colon between the offset
        NSError *error = NULL;
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"([0-9]{2})(:)([0-9]{2})$" options:NSRegularExpressionCaseInsensitive error:&error];
        dateString = [regex stringByReplacingMatchesInString:dateString options:0 range:NSMakeRange(0, [dateString length]) withTemplate:@"$1$3"];
    }
    NSDateFormatter *formatter = [self railsDateFormatter];
    NSDate *date = [formatter dateFromString:dateString];
    return date;
}

-(NSString*)railsDateString
{
    NSDateFormatter *formatter = [NSDate railsDateFormatter];
    NSString *dateString = [formatter stringFromDate:self];
    return dateString;
}

+(NSDate*)today
{
    NSDate *today = [NSDate date];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:today];
    return [calendar dateFromComponents:components];
}

+(NSDate*)yesterday
{
    NSDate *today = [NSDate today];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSHourCalendarUnit fromDate:today];
    components.hour = -24;
    return [calendar dateByAddingComponents:components toDate: today options:0];
}
+(NSDate*)tomorrow
{
    NSDate *today = [NSDate today];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSHourCalendarUnit fromDate:today];
    components.hour = 24;
    return [calendar dateByAddingComponents:components toDate: today options:0];
}

-(NSDate*)beginningOfWeek
{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSYearForWeekOfYearCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekCalendarUnit|NSWeekdayCalendarUnit fromDate:self];
    components.weekday = 1;
    return [calendar dateFromComponents:components];
}

-(NSDate*)endOfWeek
{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSYearForWeekOfYearCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekCalendarUnit|NSWeekdayCalendarUnit fromDate:self];
    components.weekday = 7;
    components.hour = 23;
    components.minute = 59;
    components.second = 59;
    return [calendar dateFromComponents:components];
}

-(BOOL)isToday
{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:self];
    NSDate *selfDate = [calendar dateFromComponents:components];
    return [[NSDate today] isEqualToDate: selfDate];
}

-(BOOL)isYesterday
{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:self];
    NSDate *selfDate = [calendar dateFromComponents:components];
    return [[NSDate yesterday] isEqualToDate: selfDate];
}

-(BOOL)isTomorrow
{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:self];
    NSDate *selfDate = [calendar dateFromComponents:components];
    return [[NSDate tomorrow] isEqualToDate: selfDate];
}

-(NSString*)relativeDateString:(NSDateFormatter*)formatter
{
    NSString *formatted;
    if([self isTomorrow]){
        formatted = @"Tomorrow";
    }else if ([self isToday]){
        formatted = @"Today";
    }else if ([self isYesterday]){
        formatted = @"Yesterday";
    }else{
        formatted = [formatter stringFromDate:self];
    }
    return formatted;
}

@end
