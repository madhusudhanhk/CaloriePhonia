//
//  CPStyles.m
//  CaloriePhonia
//
//  Created by Madhusudhan.HK on 8/13/15.
//  Copyright (c) 2015 Madhusudhan.HK. All rights reserved.
//

#import "CPStyles.h"
#import "UIColor+Helper.h"


@interface CPStyles ()

@end

@implementation CPStyles

static UIColor *_backgroundColor;
static UIColor *_contentBackgroundColor;
static UIColor *_contentAltenatingBackgroundColor;
static UIColor *_contentTextDisabledColor;
static UIColor *_contentTextColor;
static UIColor *_dateTextColor;
static UIColor *_badgeTextColor;
static UIColor *_borderColor;
static UIColor *_borderHighlightColor;
static UIColor *_sectionHeaderStartColor;
static UIColor *_sectionHeaderEndColor;
static UIColor *_sectionHeaderShadowColor;
static UIColor *_sectionHeaderTextColor;
static UIColor *_progressBarStartColor;
static UIColor *_progressBarEndColor;
static UIColor *_progressBarBackgroundColor;
static UIColor *_correctColor;
static UIColor *_incorrectColor;

static UIFont *_sectionHeaderTextFont;
static UIFont *_smallPercentFont;
static UIFont *_largePercentFont;
static UIFont *_questionTextFont;
static UIFont *_resultTextFont;
static UIFont *_resultTextBoldFont;

static NSArray *_badges;
static NSArray *_badgeSizes;

static NSDateFormatter *_shortDateFormatter;

+(UIColor*)backgroundColor{
    if(_backgroundColor == nil){
        _backgroundColor = [UIColor r:237 g:237 b:237 a:1.0];
    }
    return _backgroundColor;
}

+(UIColor*)contentBackgroundColor{
    if(_contentBackgroundColor == nil){
        _contentBackgroundColor = [UIColor r:249 g:249 b:249 a:1.0];
    }
    return _contentBackgroundColor;
}

+(UIColor*)contentAlternateBackgroundColor{
    if(_contentAltenatingBackgroundColor == nil){
        _contentAltenatingBackgroundColor = [UIColor r:241 g:243 b:245 a:1.0];
    }
    return _contentAltenatingBackgroundColor;
}

+(UIColor*)contentTextColor{
    if(_contentTextColor == nil){
        _contentTextColor = [UIColor blackColor];
    }
    return _contentTextColor;
}

+(UIColor*)contentTextDisabledColor{
    if(_contentTextDisabledColor == nil){
        _contentTextDisabledColor = [CPStyles dateTextColor];
    }
    return _contentTextDisabledColor;
}

+(UIColor*)dateTextColor{
    if(_dateTextColor == nil){
        _dateTextColor = [UIColor r:128 g:128 b:128 a:1.0];
    }
    return _dateTextColor;
}


+(UIColor*)badgeTextColor{
    if(_badgeTextColor == nil){
        _badgeTextColor = [UIColor whiteColor];
    }
    return _badgeTextColor;
}

+(UIColor*)borderColor{
    if(_borderColor == nil){
        _borderColor = [UIColor r:166 g:175 b:178 a:1.0];
    }
    return _borderColor;
}

+(UIColor*)borderHighlightColor{
    if(_borderHighlightColor == nil){
        _borderHighlightColor = [UIColor r:217 g:223 b:229 a:1.0];//197,203,209
    }
    return _borderHighlightColor;
}

+(UIColor*)sectionHeaderStartColor
{
    if (_sectionHeaderStartColor == nil) {
        _sectionHeaderStartColor = [UIColor r:157 g:172 b:180 a:1.0];//157,172,180
    }
    return _sectionHeaderStartColor;
}

+(UIColor*)sectionHeaderEndColor
{
    if (_sectionHeaderEndColor == nil) {
        _sectionHeaderEndColor = [UIColor r:184 g:193 b:200 a:1.0];//197,203,209 //184,193,200
    }
    return _sectionHeaderEndColor;
}

+(UIColor*)sectionHeaderShadowColor
{
    if (_sectionHeaderShadowColor == nil) {
        _sectionHeaderShadowColor = [UIColor r:189 g:195 b:199 a:1.0];//189,195,199
    }
    return _sectionHeaderShadowColor;
}

+(UIColor*)sectionHeaderTextColor
{
    if (_sectionHeaderTextColor == nil) {
        _sectionHeaderTextColor = [UIColor r:51 g:51 b:51 a:1.0];
    }
    return _sectionHeaderTextColor;
}

+(UIColor*)progressBarStartColor
{
    if (_progressBarStartColor == nil) {
        _progressBarStartColor = [UIColor r:122 g:171 b:51 a:1.0];
    }
    return _progressBarStartColor;
}

+(UIColor*)progressBarEndColor
{
    if (_progressBarEndColor == nil) {
        _progressBarEndColor = [UIColor r:98 g:141 b:41 a:1.0];
    }
    return _progressBarEndColor;
}

+(UIColor*)progressBarBackgroundColor
{
    if (_progressBarBackgroundColor == nil) {
        _progressBarBackgroundColor = [UIColor r:213 g:226 b:230 a:1.0];
    }
    return _progressBarBackgroundColor;
}

+(UIColor*)correctColor
{
    if (_correctColor == nil) {
        _correctColor = [UIColor r:119 g:164 b:0 a:1.0];
    }
    return _correctColor;
}

+(UIColor*)incorrectColor
{
    if (_incorrectColor == nil) {
        _incorrectColor = [UIColor r:133 g:139 b:145 a:1.0];
    }
    return _incorrectColor;
}

+(UIFont*)questionTextFont{
    if(_questionTextFont == nil){
        _questionTextFont = [UIFont fontWithName:@"HelveticaNeue" size:15.0];
    }
    return _questionTextFont;
}

+(UIFont*)sectionHeaderTextFont{
    if(_sectionHeaderTextFont == nil){
        _sectionHeaderTextFont = [UIFont fontWithName:@"Helvetica-Bold" size:18.0];
    }
    return _sectionHeaderTextFont;
}

+(UIFont*)smallPercentFont{
    if(_smallPercentFont == nil){
        _smallPercentFont = [UIFont fontWithName:@"Helvetica-Bold" size:18.0];
    }
    return _smallPercentFont;
}

+(UIFont*)largePercentFont{
    if(_largePercentFont == nil){
        _largePercentFont = [UIFont fontWithName:@"Helvetica-Bold" size:24.0];
    }
    return _largePercentFont;
}

+(UIFont*)resultTextFont{
    if(_resultTextFont == nil){
        _resultTextFont = [UIFont fontWithName:@"HelveticaNeue" size:14.0];
    }
    return _resultTextFont;
}

+(UIFont*)resultTextBoldFont{
    if(_resultTextBoldFont == nil){
        _resultTextBoldFont = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0];
    }
    return _resultTextBoldFont;
}

+(NSArray*)badges{
    if(_badges == nil){
        _badges = @[[UIImage imageNamed:@"badge_1"], [UIImage imageNamed:@"badge_2"], [UIImage imageNamed:@"badge_3"]];
    }
    return _badges;
}

+(NSArray*)badgeSizes{
    if(_badgeSizes == nil){
        _badgeSizes = @[[NSValue valueWithCGSize:CGSizeMake(27,27)],
                        [NSValue valueWithCGSize:CGSizeMake(38,27)],
                        [NSValue valueWithCGSize:CGSizeMake(46,27)]];
    }
    return _badgeSizes;
}

+(NSDateFormatter*)shortDateFormatter{
    if(_shortDateFormatter == nil){
        _shortDateFormatter = [[NSDateFormatter alloc] init];
        // [_shortDateFormatter setDateFormat:@"M/d/YY"];
        [_shortDateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC-06:00"]];
        [_shortDateFormatter setDateFormat:@"M/d/yy"];
    
    }
    return _shortDateFormatter;
}

+(void)setup{
    
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
        
        // resources for iOS 6.1 or earlier
        UIImage *backButtonImage = [UIImage imageNamed:@"back_button"];
        backButtonImage = [backButtonImage resizableImageWithCapInsets: UIEdgeInsetsMake(0, 15, 0, 5)];
        
        [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage
                                                          forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        
    } else {
        
        //resources for iOS 7 or later
    }
   
}



+(UIImage*)imageForFavorite:(BOOL)favorite{
    UIImage *image;
    if(favorite){
        image = [UIImage imageNamed:@"favorite_star"];
    }else{
        image = [UIImage imageNamed:@"unfavorite_star"];
    }
    return image;
}

@end
