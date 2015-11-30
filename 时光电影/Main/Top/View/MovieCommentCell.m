//
//  MovieCommentCell.m
//  时光电影
//
//  Created by huiwenjiaoyu on 15/11/6.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import "MovieCommentCell.h"
#import "UIImageView+WebCache.h"
#import "UIViewExt.h"

@implementation MovieCommentCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.nickName.text = self.topDetail.nickname;
    self.content.text = self.topDetail.content;
    self.rating.text = self.topDetail.rating;
    _rating.right = kScreenWidth - 10;
    
    NSString *urlString = self.topDetail.userImage;
    [self.userImage sd_setImageWithURL:[NSURL URLWithString:urlString]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
