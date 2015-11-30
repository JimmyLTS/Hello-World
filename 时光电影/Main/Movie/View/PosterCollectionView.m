//
//  PosterCollectionView.m
//  时光电影
//
//  Created by huiwenjiaoyu on 15/11/7.
//  Copyright © 2015年 Jimmy. All rights reserved.
//
#define identify @"PosterViewCell"
#import "PosterCollectionView.h"



@implementation PosterCollectionView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self registerClass:[PosterViewCell class] forCellWithReuseIdentifier:identify];
    }
    return self;
}



#pragma mark - 数据源方法

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PosterViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    Movie *movie = self.data[indexPath.row];
    NSString *url = [movie.images objectForKey:@"large"];
    [cell.image sd_setImageWithURL:[NSURL URLWithString:url]];
    cell.movie = self.data[indexPath.row];
    return cell;
}

//点击翻转
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.currentItem == indexPath.item) {
        PosterViewCell *pCell = (PosterViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
        [pCell flipCell];
    }
    else
    {
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        self.currentItem = indexPath.item;
    }
}

//结束显示时调用
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    PosterViewCell *pCell = (PosterViewCell *)cell;
   [pCell.contentView insertSubview:pCell.image aboveSubview:pCell.detailView];
}

@end
