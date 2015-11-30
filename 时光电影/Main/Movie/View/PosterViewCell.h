//
//  PosterViewCell.h
//  时光电影
//
//  Created by huiwenjiaoyu on 15/11/7.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
#import "PosterDetailView.h"

@interface PosterViewCell : UICollectionViewCell
{
    BOOL _left;
}
@property (nonatomic,strong)Movie *movie;
@property (nonatomic,strong)UIImageView *image;
@property (nonatomic,strong)PosterDetailView *detailView;

- (void)flipCell;
@end
