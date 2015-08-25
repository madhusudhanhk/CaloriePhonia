//
//  CPStyles.h
//  CaloriePhonia
//
//  Created by Madhusudhan.HK on 8/13/15.
//  Copyright (c) 2015 Madhusudhan.HK. All rights reserved.
//
#include <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface CPStyles : NSObject

+(UIColor*)backgroundColor;
+(UIColor*)contentBackgroundColor;
+(UIColor*)contentAlternateBackgroundColor;
+(UIColor*)contentTextDisabledColor;
+(UIColor*)contentTextColor;
+(UIColor*)dateTextColor;
+(UIColor*)badgeTextColor;
+(UIColor*)borderColor;
+(UIColor*)borderHighlightColor;
+(UIColor*)sectionHeaderStartColor;
+(UIColor*)sectionHeaderEndColor;
+(UIColor*)sectionHeaderShadowColor;
+(UIColor*)sectionHeaderTextColor;
+(UIColor*)progressBarStartColor;
+(UIColor*)progressBarEndColor;
+(UIColor*)progressBarBackgroundColor;
+(UIColor*)correctColor;
+(UIColor*)incorrectColor;

+(UIFont*)sectionHeaderTextFont;
+(UIFont*)smallPercentFont;
+(UIFont*)largePercentFont;
+(UIFont*)questionTextFont;
+(UIFont*)resultTextFont;
+(UIFont*)resultTextBoldFont;

+(NSArray*)badges;
+(NSArray*)badgeSizes;

+(NSDateFormatter*)shortDateFormatter;

+(UIImage*)imageForStatus:(NSUInteger)status;
+(UIImage*)imageForFavorite:(BOOL)favorite;

+(void)setup;

@end
