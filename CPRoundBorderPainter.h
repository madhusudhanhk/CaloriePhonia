//
//  CPRoundBorderPainter.h
//  CaloriePhonia
//
//  Created by Madhusudhan.HK on 8/13/15.
//  Copyright (c) 2015 Madhusudhan.HK. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

enum  {
    CPBorderTop = 1 << 0,
    CPBorderRight = 1 << 1,
    CPBorderBottom = 1 << 2,
    CPBorderLeft = 1 << 3
};
typedef NSUInteger CPBorder;

@interface CPRoundBorderPainter : NSObject
-(void)roundCorners:(UIView*)targetView cornerRadius:(float)cornerRadius roundedCorners:(NSUInteger)roundedCorners;
-(void)drawBorders:(UIView*)targetView thickness:(float)thickness cornerRadius:(float)cornerRadius borderColor:(UIColor*)borderColor borders:(NSUInteger)borders roundedCorners:(NSUInteger)roundedCorners;
-(void)createRoundBorder:(UIView*)targetView thickness:(float)thickness cornerRadius:(float)cornerRadius borderColor:(UIColor*)borderColor borders:(NSUInteger)borders roundedCorners:(NSUInteger)roundedCorners;
@end
