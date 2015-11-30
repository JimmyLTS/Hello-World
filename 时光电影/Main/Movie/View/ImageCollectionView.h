//
//  ImageCollectionView.h
//  时光电影
//
//  Created by huiwenjiaoyu on 15/11/9.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
#import "UIImageView+WebCache.h"

@interface ImageCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,assign)CGFloat onePageWidth;
@property (nonatomic,copy)NSArray *data;
@property (nonatomic, assign)NSInteger currentItem;


@end