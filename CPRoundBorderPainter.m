//
//  CPRoundBorderPainter.m
//  CaloriePhonia
//
//  Created by Madhusudhan.HK on 8/13/15.
//  Copyright (c) 2015 Madhusudhan.HK. All rights reserved.
//

#import "CPRoundBorderPainter.h"
#import <QuartzCore/QuartzCore.h>


@interface CPRoundBorderPainter()
@property (nonatomic, strong) CAShapeLayer *borderLayer;
@end

@implementation CPRoundBorderPainter

@synthesize borderLayer = _borderLayer;

-(void)createRoundBorder:(UIView *)targetView thickness:(float)thickness cornerRadius:(float)cornerRadius borderColor:(UIColor *)borderColor borders:(NSUInteger)borders roundedCorners:(NSUInteger)roundedCorners
{
    [self roundCorners:targetView cornerRadius:cornerRadius roundedCorners:roundedCorners];
    [self drawBorders:targetView thickness:thickness cornerRadius:cornerRadius borderColor:borderColor borders:borders roundedCorners:roundedCorners];
}

-(void)roundCorners:(UIView*)targetView cornerRadius:(float)cornerRadius roundedCorners:(NSUInteger)roundedCorners
{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:targetView.bounds byRoundingCorners:roundedCorners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = targetView.bounds;
    maskLayer.path = maskPath.CGPath;
    targetView.layer.mask = maskLayer;
}

-(void)drawBorders:(UIView *)targetView thickness:(float)thickness cornerRadius:(float)cornerRadius borderColor:(UIColor *)borderColor borders:(NSUInteger)borders roundedCorners:(NSUInteger)roundedCorners
{
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    BOOL roundBottomLeft = roundedCorners & UIRectCornerBottomLeft;
    BOOL roundTopLeft = roundedCorners & UIRectCornerTopLeft;
    BOOL roundTopRight = roundedCorners & UIRectCornerTopRight;
    BOOL roundBottomRight = roundedCorners & UIRectCornerBottomRight;
    
    CGPoint startPoint, endpoint, center;
    
    // left border
    startPoint = [self bottomLeft:targetView.bounds];
    if (roundBottomLeft) {
        startPoint.y -= cornerRadius;
    }
    endpoint = [self topLeft:targetView.bounds];
    if (roundTopLeft) {
        endpoint.y += cornerRadius;
    }
    
    [path moveToPoint:startPoint];
    if (borders & CPBorderLeft) {
        [path addLineToPoint:endpoint];
    }else{
        [path moveToPoint:endpoint];
    }
    // end left border
    
    // top left corner
    if (roundTopLeft) {
        center = CGPointMake([self left:targetView.bounds] + cornerRadius, [self top:targetView.bounds] + cornerRadius);
        [path addArcWithCenter:center radius:cornerRadius startAngle:M_PI endAngle:3*M_PI_2 clockwise:YES];
    }
    // end top left corner
    
    // top border
    startPoint = [self topLeft:targetView.bounds];
    if (roundTopLeft) {
        startPoint.x += cornerRadius;
    }
    endpoint = [self topRight:targetView.bounds];
    if (roundTopRight) {
        endpoint.x -= cornerRadius;
    }
    
    [path moveToPoint:startPoint];
    if (borders & CPBorderTop) {
        [path addLineToPoint:endpoint];
    }else{
        [path moveToPoint:endpoint];
    }
    // end top border
    
    // top right corner
    if (roundTopRight) {
        center = CGPointMake([self right:targetView.bounds] - cornerRadius, [self top:targetView.bounds] + cornerRadius);
        [path addArcWithCenter:center radius:cornerRadius startAngle:3*M_PI_2 endAngle:0 clockwise:YES];
    }
    // end top right corner
    
    // right border
    startPoint = [self topRight:targetView.bounds];
    if (roundTopRight) {
        startPoint.y += cornerRadius;
    }
    endpoint = [self bottomRight:targetView.bounds];
    if (roundBottomRight) {
        endpoint.y -= cornerRadius;
    }
    
    [path moveToPoint:startPoint];
    if (borders & CPBorderRight) {
        [path addLineToPoint:endpoint];
    }else{
        [path moveToPoint:endpoint];
    }
    // end right border
    
    // bottom right corner
    if (roundBottomRight) {
        center = CGPointMake([self right:targetView.bounds] - cornerRadius, [self bottom:targetView.bounds] - cornerRadius);
        [path addArcWithCenter:center radius:cornerRadius startAngle:0 endAngle:M_PI_2 clockwise:YES];
    }
    // end bottom right corner
    
    // bottom border
    startPoint = [self bottomRight:targetView.bounds];
    if (roundBottomRight) {
        startPoint.x -= cornerRadius;
    }
    endpoint = [self bottomLeft:targetView.bounds];
    if (roundBottomLeft) {
        endpoint.x += cornerRadius;
    }
    
    [path moveToPoint:startPoint];
    if (borders & CPBorderBottom) {
        [path addLineToPoint:endpoint];
    }else{
        [path moveToPoint:endpoint];
    }
    // end bottom border
    
    // bottom left corner
    if (roundBottomLeft) {
        center = CGPointMake([self left:targetView.bounds] + cornerRadius, [self bottom:targetView.bounds] - cornerRadius);
        [path addArcWithCenter:center radius:cornerRadius startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
    }
    // end bottom left corner
    
    if (self.borderLayer == nil) {
        self.borderLayer = [CAShapeLayer layer];
    }
    self.borderLayer.frame = targetView.bounds;
    self.borderLayer.path = path.CGPath;
    self.borderLayer.strokeColor = borderColor.CGColor;
    self.borderLayer.fillColor = [[UIColor clearColor] CGColor];
    self.borderLayer.lineWidth = thickness;
    
    // might cache the layer later
    if (![targetView.layer.sublayers containsObject:self.borderLayer]) {
        [targetView.layer addSublayer:self.borderLayer];
    }
}

-(float)left:(CGRect)rect
{
    return CGRectGetMinX(rect);
}

-(float)right:(CGRect)rect
{
    return CGRectGetMaxX(rect);
}

-(float)top:(CGRect)rect
{
    return CGRectGetMinY(rect);
}

-(float)bottom:(CGRect)rect
{
    return CGRectGetMaxY(rect);
}

-(CGPoint)bottomLeft:(CGRect)rect
{
    return CGPointMake([self left:rect], [self bottom:rect]);
}

-(CGPoint)topLeft:(CGRect)rect
{
    return CGPointMake([self left:rect], [self top:rect]);
}

-(CGPoint)topRight:(CGRect)rect
{
    return CGPointMake([self right:rect], [self top:rect]);
}

-(CGPoint)bottomRight:(CGRect)rect
{
    return CGPointMake([self right:rect], [self bottom:rect]);
}

@end
