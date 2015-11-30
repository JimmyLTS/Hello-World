//
//  MovieViewController.m
//  时光网
//
//  Created by imac on 15/10/31.
//  Copyright © 2015年 imac. All rights reserved.
//

#import "MovieViewController.h"
#import "Movie.h"
#import "USMovieCell.h"
#import "starView.h"
#import "DataService.h"
#import "PosterView.h"


//#define kScreenHeight [UIScreen mainScreen].bounds.size.height
//#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface MovieViewController ()

@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1、初始化导航栏按钮
    [self _loadNavigationItem];
    //2、创建 tableView
    [self _loadTableView];
    //3、加载电影数据
    [self _loadMovieData];
    //4、创建 posterView
    [self _loadPosterView];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    // Do any additional setup after loading the view.
}

#pragma mark - 创建视图

//创建导航栏 rightItem
- (void)_loadNavigationItem
{
    //1、创建按钮父视图
    UIView *buttonView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    //2、创建2个按钮
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    [button1 setImage:[UIImage imageNamed:@"list_home"] forState:UIControlStateNormal];
    button1.frame = buttonView.bounds;
    button1.tag = 200;
    button1.hidden = YES;
    [button1 addTarget:self action:@selector(rightItemAction:) forControlEvents:UIControlEventTouchUpInside];
    [buttonView addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    [button2 setImage:[UIImage imageNamed:@"poster_home"] forState:UIControlStateNormal];
    button2.frame = buttonView.bounds;
    button2.tag = 201;
    button2.hidden = NO;
    [button2 addTarget:self action:@selector(rightItemAction:) forControlEvents:UIControlEventTouchUpInside];
    [buttonView addSubview:button2];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:buttonView];
    self.navigationItem.rightBarButtonItem = rightItem;
}

// 创建 tableView
- (void)_loadTableView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 120;
    _tableView.hidden = YES;
    _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 49+64)];
    _tableView.separatorColor = [UIColor grayColor];
    [self.view addSubview:_tableView];
}
// 创建 posterView
- (void)_loadPosterView
{
    _posterView = [[PosterView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64-49)];
    _posterView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    _posterView.hidden = NO;
    _posterView.data = _data;
    
    [self.view insertSubview:_posterView atIndex:0];
}

- (void)_loadMovieData
{
    NSDictionary *jsonDic = [DataService requestData:@"us_box.json"];
//    NSLog(@"%@",jsonDic);
    NSArray *array = [jsonDic objectForKey:@"subjects"];
    
    _data = [[NSMutableArray alloc]init];
    
    for (NSDictionary *dic in array) {
        NSDictionary *subject = [dic objectForKey:@"subject"];
        Movie *movie = [[Movie alloc]init];
        
        movie.average = [[subject objectForKey:@"rating"]objectForKey:@"average"];
        movie.collect_count = [subject objectForKey:@"collect_count"];
        movie.images = [subject objectForKey:@"images"];
        movie.movieID = [subject objectForKey:@"id"];
        movie.title = [subject objectForKey:@"title"];
        movie.subtype = [subject objectForKey:@"subtype"];
        movie.year = [subject objectForKey:@"year"];
        movie.original_title = [subject objectForKey:@"original_title"];
        
        [_data addObject:movie];
        
    }
    [_tableView reloadData];
}

#pragma mark - rightItemAction

- (void)rightItemAction:(UIButton *)button
{
    //获取 buttonView
    //1、获取 buttonView 的父视图
//    UIView *buttonView = [button superview];
    //2、获取 rightItem 的子视图
    UIView *buttonView = self.navigationItem.rightBarButtonItem.customView;
    
    UIButton *button1 = (UIButton *)[buttonView viewWithTag:200];
    UIButton *button2 = (UIButton *)[buttonView viewWithTag:201];
    button1.hidden = !button1.hidden;
    button2.hidden = !button2.hidden;
    
    _posterView.hidden = !_posterView.hidden;
    _tableView.hidden = !_tableView.hidden;
    
    [self flipView:buttonView];
    [self flipView:self.view];
    
}
#pragma mark - flipView
- (void)flipView:(UIView *)supView
{
    UIButton *button1 = (UIButton *)[self.view viewWithTag:200];
    UIViewAnimationOptions flip = button1.hidden ? UIViewAnimationOptionTransitionFlipFromLeft : UIViewAnimationOptionTransitionFlipFromRight;
    [UIView transitionWithView:supView
                      duration:0.5
                       options:flip animations:^{
                           [supView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
                       }
                    completion:nil];
}

#pragma mark - tableView 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    USMovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"movieCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"USMovieCell" owner:self options:nil]lastObject];
        
    }
    cell.movie = _data[indexPath.row];
    return cell;
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
