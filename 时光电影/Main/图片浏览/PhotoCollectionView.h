//
//  PhotoCollectionView.h
//  时光电影
//
//  Created by huiwenjiaoyu on 15/11/6.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic ,copy)NSArray *urlArray;
@end
