//
//  USMovieCell.m
//  时光网
//
//  Created by huiwenjiaoyu on 15/11/2.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import "USMovieCell.h"
#import "Movie.h"
#import "UIImageView+WebCache.h"
#import "starView.h"
#import "UIViewExt.h"
@implementation USMovieCell

- (void)awakeFromNib {
    // Initialization code
    //去掉选中风格
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _title.text = self.movie.title;
    _year.text = [NSString stringWithFormat:@"年份：%@",self.movie.year];
    _rating.text = [NSString stringWithFormat:@"%.1f",[self.movie.average floatValue]];
    _rating.right = kScreenWidth - 10;
    
    //加载图片
    NSString *medium = [self.movie.images objectForKey:@"medium"];
    NSURL *url = [NSURL URLWithString:medium];
    [_imaView sd_setImageWithURL:url];

    
    _starView.rating = [self.movie.average floatValue];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
