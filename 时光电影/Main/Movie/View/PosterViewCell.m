//
//  PosterViewCell.m
//  时光电影
//
//  Created by huiwenjiaoyu on 15/11/7.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import "PosterViewCell.h"
#import "UIImageView+WebCache.h"

@implementation PosterViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    _left = YES;
    if (self) {
        [self creatImageView];
    }
    return self;
}

- (void)creatImageView
{
    _image = [[UIImageView alloc]initWithFrame:self.contentView.bounds];
    _image.transform = CGAffineTransformMakeScale(0.95, 0.95);
    _image.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];

    [self.contentView addSubview:_image];
    
    _detailView = [[[NSBundle mainBundle]loadNibNamed:@"PosterDetailView" owner:self options:nil]lastObject];
    _detailView.frame = self.contentView.bounds;
    _detailView.transform = CGAffineTransformMakeScale(0.95, 0.95);
    _detailView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"desk_001.jpg"]];
    [self.contentView insertSubview:_detailView belowSubview:_image];
}

- (void)setMovie:(Movie *)movie
{
    if (_movie != movie) {
        _movie = movie;
        
        [_detailView setMovie:movie];
    }
}

//翻转
- (void)flipCell
{
    NSInteger index1 = [self.contentView.subviews indexOfObject:_image];
    NSInteger index2 = [self.contentView.subviews indexOfObject:_detailView];
    
    UIViewAnimationOptions flip = _left ? UIViewAnimationOptionTransitionFlipFromLeft :UIViewAnimationOptionTransitionFlipFromRight ;
    
    [UIView transitionWithView:self.contentView
                      duration:0.3
                       options:flip
                    animations:^{
                        [self.contentView exchangeSubviewAtIndex:index1 withSubviewAtIndex:index2];
                    }
                    completion:nil];
    _left = !_left;
}

//- (void)

@end
