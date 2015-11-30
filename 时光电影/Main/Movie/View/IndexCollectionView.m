//
//  IndexCollectionView.m
//  时光电影
//
//  Created by huiwenjiaoyu on 15/11/9.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import "IndexCollectionView.h"
#import "IndexCollectionViewCell.h"
#define identify @"IndexCollectionViewCell"

@implementation IndexCollectionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self registerClass:[IndexCollectionViewCell class] forCellWithReuseIdentifier:identify];
    }
    return self;
}
#pragma mark - 数据源方法
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    IndexCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    Movie *movie = self.data[indexPath.row];
    NSString *url = [movie.images objectForKey:@"small"];
    [cell.image sd_setImageWithURL:[NSURL URLWithString:url]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.currentItem != indexPath.item) {
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        self.currentItem = indexPath.item;
    }
}


@end
