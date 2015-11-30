//
//  TopCell.h
//  时光电影
//
//  Created by huiwenjiaoyu on 15/11/3.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Movie;
#import "starView.h"


@interface TopCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *average;
@property (weak, nonatomic) IBOutlet starView *star;
//@property (nonatomic,strong) Movie *movie;
@property (nonatomic,strong) Movie *movie;


@end
