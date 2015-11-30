//
//  PosterDetailView.m
//  时光电影
//
//  Created by huiwenjiaoyu on 15/11/9.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import "PosterDetailView.h"
#import "UIImageView+WebCache.h"
#import "UIViewExt.h"

@implementation PosterDetailView

- (void)setMovie:(Movie *)movie
{
    if (_movie != movie) {
        _movie = movie;
    }
    [self setNeedsLayout];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSString *url = [_movie.images objectForKey:@"medium"];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:url]];
    _imageView.size = CGSizeMake(kScreenWidth/3, kScreenWidth*1.3/3);
    
    _titleCn.text = _movie.title;
    _titleCn.left = _imageView.right+20;
    _titleEn.text = _movie.original_title;
    _titleEn.left = _titleCn.left;
    _titleEn.numberOfLines = 0;
    [_titleEn sizeToFit];
    
    _ratingView.top = _imageView.bottom+20;
    
    CGFloat rating = [_movie.average floatValue];
    _ratingView.rating = rating;
    
    _rating.text = [NSString stringWithFormat:@"%.1f",rating];
    _rating.left = _ratingView.right+20;
    _rating.bottom = _ratingView.bottom - 5;
    
}

@end
