//
//  ImageListViewController.h
//  时光电影
//
//  Created by huiwenjiaoyu on 15/11/5.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageListViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic,strong) NSMutableArray *data;
@end
