//
//  TopCell.m
//  时光电影
//
//  Created by huiwenjiaoyu on 15/11/3.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import "TopCell.h"
#import "UIImageView+WebCache.h"
#import "UIViewExt.h"
#import "Movie.h"

@implementation TopCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //title
    _title.text = self.movie.title;
    _title.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
    _title.left = _imageView.left;
    
    //average
    _average.text = [NSString stringWithFormat:@"%.1f",[self.movie.average floatValue]];
    
    //加载图片
    NSString *urlString = [self.movie.images objectForKey:@"medium"];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:urlString]];

    _star.rating = [self.movie.average floatValue];
}

@end
