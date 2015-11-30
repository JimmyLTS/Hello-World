//
//  PhotoScroll.h
//  时光电影
//
//  Created by huiwenjiaoyu on 15/11/6.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoScroll : UIScrollView<UIScrollViewDelegate>
@property (nonatomic,copy)NSURL *url;
@property (nonatomic,strong)UIImageView *imageView;
@end
