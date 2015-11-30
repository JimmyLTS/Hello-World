//
//  PosterView.h
//  时光电影
//
//  Created by huiwenjiaoyu on 15/11/7.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PosterCollectionView;
@class IndexCollectionView;
@interface PosterView : UIView
{
    UIView *_headerView;
    PosterCollectionView *_posterView;
    IndexCollectionView *_indexCollectionView;
    UILabel *_footerView;
    UIControl *_maskView;
    
}
@property (nonatomic,copy)NSArray *data;
@end
