//
//  PhotoScroll.m
//  时光电影
//
//  Created by huiwenjiaoyu on 15/11/6.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import "PhotoScroll.h"
#import "UIImageView+WebCache.h"

@implementation PhotoScroll

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.delegate = self;
        //设置缩放比例
        self.maximumZoomScale = 3.0;
        self.minimumZoomScale = 1.0;
        
        //隐藏滑动条
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        
        _imageView = [[UIImageView alloc]initWithFrame:self.bounds];
                [self addSubview:_imageView];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        
        [self addGestureRecognizer:tap];
        
        UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap2:)];
        
        tap2.numberOfTapsRequired = 2;
        [self addGestureRecognizer:tap2];
//        tap.numberOfTouchesRequired = 2;
        // ’双击‘ 时使‘单击’失效
        [tap requireGestureRecognizerToFail:tap2];
    }
    return self;
}

- (void)tap:(UITapGestureRecognizer *)tap
{
    [[NSNotificationCenter defaultCenter]postNotificationName:KClickNavigation object:nil];
}

- (void)tap2:(UITapGestureRecognizer *)tap
{
    //    NSLog(@"点击了1次");
    if (self.zoomScale > 1) {
        //        self.zoomScale = 1;
        [self setZoomScale:1 animated:YES];
        
    }else{
        //        self.zoomScale = 3;
        [self setZoomScale:3 animated:YES];
        
        
    }
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
}
- (void)setUrl:(NSURL *)url
{
    if (_url != url) {
        _url = url;
        [_imageView sd_setImageWithURL:self.url];

    }
}
@end
