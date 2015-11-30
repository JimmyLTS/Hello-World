//
//  PosterView.m
//  时光电影
//
//  Created by huiwenjiaoyu on 15/11/7.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import "PosterView.h"
#import "UIViewExt.h"
#import "PosterCollectionView.h"
#import "IndexCollectionView.h"
#import "Movie.h"
#define kHesderViewTop -(kScreenHeight/4-30)
#define kHeaderViewHeight kScreenHeight/4
#define kFooterViewHeight 35

@implementation PosterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //1、创建海报视图
        [self creatPosterView];
        //2、创建头视图
        [self creatHeaderView];
        
        [self creatIndexCollectionView];
        
        //创建尾部视图
        [self creatFooterView];
        
        //KVO
        [_posterView addObserver:self forKeyPath:@"currentItem" options:NSKeyValueObservingOptionNew context:NULL];
        
        [_indexCollectionView addObserver:self forKeyPath:@"currentItem" options:NSKeyValueObservingOptionNew context:NULL];
        
    }
    return self;
}
#pragma mark - 创建尾部视图
- (void)creatFooterView
{
    _footerView = [[UILabel alloc]initWithFrame:CGRectMake(0,self.height - kFooterViewHeight, kScreenWidth, kFooterViewHeight)];
    _footerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"poster_title_home"]];
    _footerView.textColor = [UIColor whiteColor];
    _footerView.textAlignment = NSTextAlignmentCenter;
    _footerView.font = [UIFont systemFontOfSize:16];
    [self addSubview:_footerView];
}


#pragma mark - KVO 实现
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString: @"currentItem"]) {
        NSNumber *newValue = [change objectForKey:@"new"];
        NSInteger item = [newValue integerValue];
        NSIndexPath *indexpath = [NSIndexPath indexPathForRow:item inSection:0];
        if (object == _posterView && _indexCollectionView.currentItem != item) {
            _indexCollectionView.currentItem = item;
            [_indexCollectionView scrollToItemAtIndexPath:indexpath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        }
        else if (object == _indexCollectionView && _posterView.currentItem != item )
        {
            _posterView.currentItem = item;
            [_posterView scrollToItemAtIndexPath:indexpath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        }
        Movie *movie = _data[item];
        _footerView.text = movie.title;
    }
    
}

#pragma mark - 创建头视图 collectionView
- (void)creatIndexCollectionView
{
    _indexCollectionView = [[IndexCollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kHeaderViewHeight-30)];
    _indexCollectionView.onePageWidth = kScreenWidth/4;
    _indexCollectionView.backgroundColor = [UIColor clearColor];
    [_headerView addSubview:_indexCollectionView];
//    _indexCollectionView 
}

#pragma mark - 创建头视图
- (void)creatHeaderView
{
    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, kHesderViewTop,kScreenWidth, kHeaderViewHeight)];
    _headerView.backgroundColor = [UIColor clearColor];
    
    [self addSubview:_headerView];
    
    //添加拉伸图片
    UIImage *image = [UIImage imageNamed:@"indexBG_home"];
    image = [image stretchableImageWithLeftCapWidth:0 topCapHeight:2];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kHeaderViewHeight)];
    imageView.image = image;
    
    [_headerView addSubview:imageView];
    
    //创建箭头按钮
    UIButton *arrowbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [arrowbutton setImage:[UIImage imageNamed:@"down_home"] forState:UIControlStateNormal];
    [arrowbutton setImage:[UIImage imageNamed:@"up_home"] forState:UIControlStateSelected];
    arrowbutton.frame = CGRectMake(kScreenWidth/2-8, kHeaderViewHeight-20, 20, 20);
    [arrowbutton addTarget:self action:@selector(arrowButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_headerView addSubview:arrowbutton];
    arrowbutton.tag = 101;
    
    //创建轻扫手势
    UISwipeGestureRecognizer *swipe  = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeAction:)];
    swipe.direction = UISwipeGestureRecognizerDirectionDown;
    [self addGestureRecognizer:swipe];
}

//轻扫动作
- (void)swipeAction:(UISwipeGestureRecognizer *)swipe
{
    [self showHeaderView];
}
//显示头视图
- (void)showHeaderView
{
    [UIView animateWithDuration:0.3
                     animations:^{
                         _headerView.bottom = kHeaderViewHeight;
                     }];
    UIButton *button = (UIButton *)[_headerView viewWithTag:101];
    button.selected = YES;
    
    if (_maskView == nil) {
        _maskView = [[UIControl alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        [self insertSubview:_maskView belowSubview:_headerView];
        _maskView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        [_maskView addTarget:self action:@selector(maskViewAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    _maskView.hidden = NO;
}
//遮盖视图点击
- (void)maskViewAction:(UIControl *)maskView
{
    [self hideHeaderView];
}
//隐藏头视图
- (void)hideHeaderView
{
    [UIView animateWithDuration:0.3
                     animations:^{
                         _headerView.bottom = 30;
                     }];
    UIButton *button = (UIButton *)[_headerView viewWithTag:101];
    button.selected = !button.selected;
    _maskView.hidden = YES;
}
//头视图下拉按钮
- (void)arrowButtonAction:(UIButton *)button
{
    if (button.selected == NO)
        [self showHeaderView];
    else
        [self hideHeaderView];
}

#pragma mark - 创建海报视图

- (void)creatPosterView
{
    _posterView = [[PosterCollectionView alloc]initWithFrame:CGRectMake(0, 30, kScreenWidth, self.height-30-kFooterViewHeight)];
    _posterView.onePageWidth = kScreenWidth-100;
    _posterView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    [self addSubview:_posterView];
}

- (void)setData:(NSArray *)data
{
    if (_data != data) {
        _data = data;
        _posterView.data = data;
        _indexCollectionView.data = data;
        if (_data.count > 0) {
            Movie *movie = _data[0];
            _footerView.text = movie.title;
        }
    }
    
}

@end
