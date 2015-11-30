//
//  starView.m
//  时光网
//
//  Created by huiwenjiaoyu on 15/11/2.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import "starView.h"
#import "Movie.h"
#import "USMovieCell.h"

@implementation starView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatStarView];
    }
    return self;
}

- (void)awakeFromNib
{
    [self creatStarView];
}

- (void)creatStarView
{
    UIImage *goldStar = [UIImage imageNamed:@"yellow"];
    UIImage *grayStar = [UIImage imageNamed:@"gray"];
//    CGFloat k = [value floatValue]/2;
    //1、创建灰色星星
    _grayStarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, grayStar.size.width*5, grayStar.size.height)];
    _grayStarView.backgroundColor = [UIColor colorWithPatternImage:grayStar];
    [self addSubview:_grayStarView];
    
    //2、创建金色星星
    
    _goldStarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, goldStar.size.width*5, goldStar.size.height)];
    _goldStarView.backgroundColor = [UIColor colorWithPatternImage:goldStar];
    [self addSubview:_goldStarView];
    
//    self.backgroundColor = [UIColor greenColor];
    
    //3、设置当前视图的尺寸
    CGFloat starWidth = self.frame.size.height*5;
    CGRect frame = self.frame;
    frame.size.width = starWidth;
    self.frame = frame;
    
    CGFloat scale = self.frame.size.height/goldStar.size.height;
    
    //4、放大星星
    _goldStarView.transform = CGAffineTransformMakeScale(scale, scale);
    _grayStarView.transform = CGAffineTransformMakeScale(scale, scale);

    CGRect f1 = _grayStarView.frame;
    CGRect f2 = _goldStarView.frame;
    f1.origin = CGPointZero;
    f2.origin = CGPointZero;
    _grayStarView.frame = f1;
    _goldStarView.frame = f2;
}

- (void)setRating:(float)rating
{
    _rating = rating;
    CGFloat s = rating/2.0;
    CGFloat width = self.frame.size.height*s;
    CGRect frame = _goldStarView.frame;
    frame.size.width = width;
    _goldStarView.frame = frame;
}

@end
