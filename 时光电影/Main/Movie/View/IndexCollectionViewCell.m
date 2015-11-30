//
//  IndexCollectionViewCell.m
//  时光电影
//
//  Created by huiwenjiaoyu on 15/11/9.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import "IndexCollectionViewCell.h"

@implementation IndexCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatImageView];
    }
    return self;
}

- (void)creatImageView
{
    _image = [[UIImageView alloc]initWithFrame:self.contentView.bounds];
    _image.transform = CGAffineTransformMakeScale(0.9, 0.9);
    [self.contentView addSubview:_image];
}


@end
