//
//  ImageCollectionView.m
//  时光电影
//
//  Created by huiwenjiaoyu on 15/11/9.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import "ImageCollectionView.h"

@implementation ImageCollectionView



- (instancetype)initWithFrame:(CGRect)frame
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 0;
    
    self = [super initWithFrame:frame collectionViewLayout:flowLayout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        
        //        self.pagingEnabled = YES;
        
        //设置scrollView减速的速度
        //范围（0-1）默认 0， 1
        self.decelerationRate = 0.1;
    }
    //    self.contentInset = UIEdgeInsetsMake(0, 50, 0, 50);
    return self;
}
//设置偏移量

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    CGFloat offsetX = (self.frame.size.width - _onePageWidth)/2;
    return UIEdgeInsetsMake(0, offsetX, 0, offsetX);
}

//设置单元格尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.onePageWidth, self.frame.size.height);
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    int index = (targetContentOffset->x + _onePageWidth/2)/_onePageWidth;
    targetContentOffset->x = index*_onePageWidth;
    if (self.currentItem == index && index < self.data.count - 1)
    {
        if (velocity.x > 0.2) {
            index++;
        }
        else if (velocity.x < -0.2)
        {
            index--;
        }
    }
    if (targetContentOffset->x <= 0 ) {
        index = 0;
    }
    self.currentItem = index;
    
}

#pragma mark - 数据源方法

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _data.count;
}


@end
