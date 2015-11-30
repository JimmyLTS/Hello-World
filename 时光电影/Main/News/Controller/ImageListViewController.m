//
//  ImageListViewController.m
//  时光电影
//
//  Created by huiwenjiaoyu on 15/11/5.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import "ImageListViewController.h"
#import "DataService.h"
#import "imageModel.h"
#import "UIImageView+WebCache.h"
#import "ImageDetailController.h"
#import "ImageDetailController.h"
#import "MyNavigationController.h"

@interface ImageListViewController ()

@end

@implementation ImageListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _collectionView.frame = self.view.bounds;
    self.title = @"图片新闻";
    
    self.view.backgroundColor = [UIColor  colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    
    [self loadData];
}

- (void)loadData
{
    NSArray *array = [DataService requestData:@"image_list.json"];
    _data = [[NSMutableArray alloc]initWithCapacity:array.count];
    for (NSDictionary *dic in array) {
        imageModel *news = [[imageModel alloc]initContentWithDic:dic];
        
        [_data addObject:news];
    }
    [_collectionView reloadData];
}

#pragma mark - UICollectionView 代理方法、数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"imageListCell" forIndexPath:indexPath];
    UIImageView *imaV = (UIImageView *)[cell viewWithTag:110];
    imageModel *news = _data[indexPath.item];
    NSString *urlString = news.image;
    [imaV sd_setImageWithURL:[NSURL URLWithString:urlString]];

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //读取图片
    NSMutableArray *urlArray = [[NSMutableArray alloc]init];
//    for (imageModel *imageModel in self.data) {
//        [urlArray addObject:imageModel.image];
//    }
    for (int i = 0; i<_data.count; i++) {
        imageModel *imageModel = _data[i];
        [urlArray addObject:imageModel.image];
    }
    
    
    //模态视图
    ImageDetailController *imageDetail = [[ImageDetailController alloc]init];
    MyNavigationController *my = [[MyNavigationController alloc]initWithRootViewController:imageDetail];
    
    
    imageDetail.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    //传递图片数据
    imageDetail.urlArray = urlArray;
    imageDetail.indexPath = indexPath;
    
    [self presentViewController:my animated:YES completion:nil];
    
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
