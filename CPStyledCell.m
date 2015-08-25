//
//  CPStyledCell.h
//  CaloriePhonia
//
//  Created by Madhusudhan.HK on 8/13/15.
//  Copyright (c) 2015 Madhusudhan.HK. All rights reserved.
//

#import "CPStyledCell.h"
#import "CPRoundBorderPainter.h"

@interface CPStyledCell()
@property (nonatomic, strong) CPRoundBorderPainter *painter;
@end

@implementation CPStyledCell
@synthesize lastCell = _lastCell;
@synthesize painter = _painter;
@synthesize alternate = _alternate;
@synthesize alternates = _alternates;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.painter = [[CPRoundBorderPainter alloc] init];
        self.alternates = NO;
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    [self updateBackgroundColor];
}

-(void)updateBackgroundColor
{
    UIColor *backgroundColor;
    if (self.alternates && self.alternate) {
        backgroundColor = [CPStyles contentAlternateBackgroundColor];;
    }else{
        backgroundColor = [CPStyles contentBackgroundColor];
    }
    if (self.backgroundView == nil) {
        self.backgroundView = [[UIView alloc] initWithFrame:self.frame];
    }
    self.backgroundView.backgroundColor = backgroundColor;
}

-(void)setAlternate:(BOOL)alternate
{
    _alternate = alternate;
    [self updateBackgroundColor];
}

-(void)setAlternates:(BOOL)alternates
{
    _alternates = alternates;
    [self updateBackgroundColor];
}

-(void)setLastCell:(BOOL)lastCell
{
    _lastCell = lastCell;
    [self updateRoundBorders];
}

-(void)setFrame:(CGRect)frame
{
    float inset = 10;
    frame.origin.x += inset;
    frame.size.width -= 2 * inset;
    [super setFrame:frame];
}

-(void)updateRoundBorders
{
    NSUInteger borders = 0;
    NSUInteger roundedCorners = 0;
    if(self.lastCell){
        borders = CPBorderLeft|CPBorderRight|CPBorderBottom;
        roundedCorners = UIRectCornerBottomLeft|UIRectCornerBottomRight;
    }else{
        borders = CPBorderLeft|CPBorderRight;
        roundedCorners = 0;
    }
    [self createRoundBorders:borders roundedCorners:roundedCorners];
}

-(void)createRoundBorders:(NSUInteger)borders roundedCorners:(NSUInteger)roundedCorners
{
    [self.painter createRoundBorder:self thickness:1.0 cornerRadius:10.0 borderColor:[CPStyles borderColor] borders:borders roundedCorners:roundedCorners];
}

@end
