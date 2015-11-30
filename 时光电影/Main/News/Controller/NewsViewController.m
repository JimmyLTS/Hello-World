//
//  NewsViewController.m
//  时光网
//
//  Created by imac on 15/10/31.
//  Copyright © 2015年 imac. All rights reserved.
//

#import "NewsViewController.h"
#import "DataService.h"
#import "newsModel.h"
#import "NewsTableCell.h"
#import "UIImageView+WebCache.h"
#import "UIViewExt.h"
#import "NewsDetailController.h"
#import "ImageListViewController.h"

CGFloat headerHeight = 150;
@interface NewsViewController ()
{
    UIImageView *_imageView;
    UILabel *_titleLable;
}


@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _newsTable.backgroundColor = [UIColor clearColor];
    _newsTable.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 64+49)];
    _newsTable.frame = self.view.bounds;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    
    [self _creatHeaderView];
    //1、加载数据
    [self _loadData];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)_creatHeaderView
{
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, headerHeight)];
    [self.view insertSubview:_imageView belowSubview:_newsTable];
    
    _titleLable = [[UILabel alloc]initWithFrame:CGRectMake(0, headerHeight-20, kScreenWidth, 20)];
    _titleLable.font = [UIFont systemFontOfSize:18];
    _titleLable.textColor = [UIColor whiteColor];
    [self.view insertSubview:_titleLable belowSubview:_newsTable];
}

- (void)loadHeadData
{
    if (_data.count > 0) {
        newsModel *news = _data[0];
        [_imageView sd_setImageWithURL:[NSURL URLWithString:news.image]];
        _titleLable.text = news.title;
    }
}

- (void)_loadData
{
    NSArray *array = [DataService requestData:@"news_list.json"];
//    NSLog(@"%@",array);
    _data = [[NSMutableArray alloc]initWithCapacity:array.count];
    
    for (NSDictionary *dic in array) {
        newsModel *news = [[newsModel alloc]init];
        
        news.newsId = [dic objectForKey:@"id"];
        news.type = [dic objectForKey:@"type"];
        news.title = [dic objectForKey:@"title"];
        news.summary = [dic objectForKey:@"summary"];
        news.image = [dic objectForKey:@"image"];
        
        [_data addObject:news];
        
    }
    //刷新 newsTable
    [_newsTable reloadData];
    [self loadHeadData];
}

#pragma mark - newsTable 数据源方法和代理方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsFirstCell" forIndexPath:indexPath];
        
        cell.backgroundColor = [UIColor clearColor];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        return cell;
    }
    NewsTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsOtherCell" forIndexPath:indexPath];
    cell.newsModel = _data[indexPath.row];
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

//点击单元格调用
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    newsModel *news = self.data[indexPath.row];
    NSInteger type = [news.type integerValue];
    if (type == 0) {
        NewsDetailController *newsDetail = [self.storyboard instantiateViewControllerWithIdentifier:@"NewsDetailController"];
        newsDetail.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:newsDetail animated:YES];
    }
    else if (type == 1)
    {
        ImageListViewController *imageList = [self.storyboard instantiateViewControllerWithIdentifier:@"ImageListViewController"];
        imageList.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:imageList animated:YES];
    }
    else if (type == 2)
    {
        UIViewController *audioView = [[UIViewController alloc]init];
        audioView.title = @"视频新闻";
        
        
        UIWebView *webView  = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        NSURL *url = [NSURL URLWithString:@"http://v.youku.com/v_show/id_XNDIxMjczMDky.html"];
        
        NSURLRequest *request =  [[NSURLRequest alloc]initWithURL:url];
        
        [webView loadRequest:request];
        
        
        [audioView.view addSubview:webView];
        
        [self.navigationController pushViewController:audioView animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 150;
    }
    return 60;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > 0 ) {
        _imageView.top = -offsetY*0.5;
        _titleLable.bottom = _imageView.bottom;
    }
    else
    {
        CGFloat height = ABS(offsetY) + headerHeight;
        CGFloat width = kScreenWidth*(height/headerHeight);
        _imageView.transform = CGAffineTransformMakeScale(width/kScreenWidth, height/150);
        _imageView.top = 0;
        
        _titleLable.bottom = _imageView.bottom;
    }
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
