//
//  NewsTableCell.m
//  时光电影
//
//  Created by huiwenjiaoyu on 15/11/3.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import "NewsTableCell.h"
#import "UIImageView+WebCache.h"
#import "UIViewExt.h"

@implementation NewsTableCell

- (void)awakeFromNib {
    // Initialization code
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    // newsImage
    NSString *urlString = self.newsModel.image;
    [_newsImage sd_setImageWithURL:[NSURL URLWithString:urlString]];
    
    //title  summary
    _newsTitle.text = self.newsModel.title;
    _newsTitle.width = kScreenWidth - 80;
    
    _summary.text = self.newsModel.summary;
    _summary.width = kScreenWidth - 110;
    
    
    NSInteger type = [self.newsModel.type integerValue];
    if (type == 0) { //普通新闻
        _iconImg.hidden = YES;
        _summary.left = _newsImage.right+10;
        
    }
    else if (type == 1)
    {
        _iconImg.hidden = NO;
        _iconImg.image = [UIImage imageNamed:@"sctpxw"];
        _summary.left = _iconImg.right+10;
    }
    else if (type == 2)
    {
        _iconImg.hidden = NO;
        _iconImg.image = [UIImage imageNamed:@"scspxw"];
        _summary.left = _iconImg.right+10;
    }
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
