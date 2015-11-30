//
//  MainTabBarController.m
//  时光网
//
//  Created by imac on 15/10/31.
//  Copyright © 2015年 imac. All rights reserved.
//

#import "MainTabBarController.h"
#import "TabBarButton.h"


@interface MainTabBarController ()
{
    UIImageView *_selectImg;
}

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tab_bg_all"]];
    
    //导航栏
    [[UINavigationBar appearance]setBackgroundImage:[UIImage imageNamed:@"nav_bg_all-64"] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self creatTabBar];
}

#pragma mark - CreatTabBar
- (void)creatTabBar
{
    // 从 TabBar 中拿到所有子视图
    for (UIView *view in self.tabBar.subviews) {
        Class cls = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:cls]) {
            [view removeFromSuperview];
        }
    }
    NSArray *imgArray = @[@"movie_home",@"msg_new",@"start_top250",@"icon_cinema",@"more_setting"];
    NSArray *titleArray = @[@"电影",@"新闻",@"Top250",@"影院",@"更多"];
    
    CGFloat width = kScreenWidth / imgArray.count;
    CGFloat height = CGRectGetHeight(self.tabBar.frame);
    
    /*
    //遍历数组，创建Button
    for (int i = 0; i < imgArray.count; i++) {
        
        NSString *title = titleArray[i];
        NSString *image = imgArray[i];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(width*i, 0, width, height);
        [button setTitle:title forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:11];
        
        //设置编译
        button.titleEdgeInsets = UIEdgeInsetsMake(30, -20, 0, 0);
        button.imageEdgeInsets = UIEdgeInsetsMake(-15, 20, 0, 0);
        
        button.tag = i+1;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.tabBar addSubview:button];

    }
    */
    if (_selectImg == nil) {
    
        //创建点击遮盖视图
        _selectImg = [[UIImageView alloc]initWithFrame:CGRectMake(7, 0, 50, 45)];
        _selectImg.image = [UIImage imageNamed:@"selectTabbar_bg_all1"];
        [self.tabBar addSubview:_selectImg];
    }
    
    //创建标签栏按钮
    for (int i = 0; i < imgArray.count; i++) {
        
        NSString *title = titleArray[i];
        NSString *image = imgArray[i];
        
        CGRect frame = CGRectMake(width*i, 0, width, height);
        
        TabBarButton *button = [[TabBarButton alloc]initWithFrame:frame imageName:image title:title];
        button.tag = i;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.tabBar addSubview:button];
        
        if (i == 0 && button.selected == YES ) {
            _selectImg.center = button.center;
        }
    }
    
   
}

- (void)buttonAction:(UIButton *)button
{
    self.selectedIndex = button.tag;
    //为遮盖视图响应点击，添加动画
    [UIView animateWithDuration:0.18
                     animations:^{
                         _selectImg.center = button.center;
                     }];
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
