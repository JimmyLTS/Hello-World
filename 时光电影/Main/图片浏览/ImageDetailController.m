//
//  ImageDetailController.m
//  时光电影
//
//  Created by huiwenjiaoyu on 15/11/6.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import "ImageDetailController.h"
#import "PhotoCollectionView.h"

@interface ImageDetailController ()
{
    BOOL _isHidden;
}

@end

@implementation ImageDetailController

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _isHidden = NO;
    // Do any additional setup after loading the view.
    self.title = @"图片";
    self.view.backgroundColor = [UIColor greenColor];
    
    UINavigationBar *navigationbar = self.navigationController.navigationBar;
    [navigationbar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    navigationbar.barStyle = UIBarStyleBlack;
    
    //设置半透明
    navigationbar.translucent = YES;
    
    //设置返回图片
    UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(leftAction)];

    self.navigationItem.leftBarButtonItem = left;
    
    PhotoCollectionView *collectionView = [[PhotoCollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    
    collectionView.pagingEnabled = YES;
    collectionView.urlArray = self.urlArray;
    [collectionView scrollToItemAtIndexPath:self.indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    
    [self.view addSubview:collectionView];
    
    //    self.navigationController.hidesBarsOnTap = YES;
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notificationAction:) name:KClickNavigation object:nil];
    
    //创建手势
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
//    
//    [self.view addGestureRecognizer:tap];
    
}

- (void)notificationAction:(UIGestureRecognizer *)tap
{
    _isHidden = !_isHidden;
    
    [self.navigationController setNavigationBarHidden:_isHidden animated:YES];
    
//     self.navigationController.navigationBarHidden = _isHidden;
}

- (void)leftAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
