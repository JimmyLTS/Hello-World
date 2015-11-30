//
//  PhotoCell.m
//  时光电影
//
//  Created by huiwenjiaoyu on 15/11/6.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import "PhotoCell.h"


@implementation PhotoCell

- (void)setUrlString:(NSString *)urlString
{
    if (_urlString != urlString) {
        _urlString = urlString;
        _scroll.url = [NSURL URLWithString:urlString];
        
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _scroll = [[PhotoScroll alloc]initWithFrame:self.bounds];
        [self.contentView addSubview:_scroll];
    }
    return self;
}

@end
