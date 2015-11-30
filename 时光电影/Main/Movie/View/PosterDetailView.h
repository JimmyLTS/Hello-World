//
//  PosterDetailView.h
//  时光电影
//
//  Created by huiwenjiaoyu on 15/11/9.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
#import "starView.h"

@interface PosterDetailView : UIView
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *titleCn;
@property (strong, nonatomic) IBOutlet UILabel *titleEn;
@property (strong, nonatomic) IBOutlet starView *ratingView;
@property (strong, nonatomic) IBOutlet UILabel *rating;
@property (nonatomic,strong)Movie *movie;
@end
