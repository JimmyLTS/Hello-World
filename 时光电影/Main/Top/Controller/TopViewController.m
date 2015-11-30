//
//  TopViewController.m
//  时光网
//
//  Created by imac on 15/10/31.
//  Copyright © 2015年 imac. All rights reserved.
//

#import "TopViewController.h"
#import "DataService.h"
#import "Movie.h"
#import "TopCell.h"
#import "UIImageView+WebCache.h"
#import "TopDetailController.h"
#import "MyNavigationController.h"

static NSString *identify = @"topCell";


@interface TopViewController ()


@end

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self _loadData];
    // Do any additional setup after loading the view.
    
    _topCollection.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    
    _topCollection.frame = self.view.bounds;
    
    //注册单元格类型
    [_topCollection registerNib:[UINib nibWithNibName:@"TopCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"topCell"];
    
}

/*
//设置边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 10, 0, 10);
}
*/

- (void)_loadData
{
    NSDictionary *dic = [DataService requestData:@"top250.json"];
    
    NSArray *array = [dic objectForKey:@"subjects"];
    _data = [[NSMutableArray alloc]init];
    
    for (NSDictionary *dic2 in array) {
        
        Movie *movie = [[Movie alloc]init];
        movie.images =  [dic2 objectForKey:@"images"];
//        NSLog(@"%@",movie.images);
        movie.title = [dic2 objectForKey:@"title"];
        movie.average = [[dic2 objectForKey:@"rating"]objectForKey:@"average"];
        
        [_data addObject:movie];
    }
    [_topCollection reloadData];
}

#pragma mark - collectionView 数据源方法，代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _data.count*10;
}

- (TopCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"topCell" forIndexPath:indexPath];
    cell.movie = _data[indexPath.row%10];
    
    return cell;
}

//点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    TopDetailController *topDetail = [self.storyboard instantiateViewControllerWithIdentifier:@"TopDetailController"];
//    topDetail.hidesBottomBarWhenPushed = YES;

    [self.navigationController pushViewController:topDetail animated:YES];
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
