//
//  NewsDetailController.m
//  时光电影
//
//  Created by huiwenjiaoyu on 15/11/5.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import "NewsDetailController.h"
#import "DataService.h"

@interface NewsDetailController ()
{
    UIWebView *_webView;
    UIActivityIndicatorView *_indicatorView;
}

@end

@implementation NewsDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"普通新闻";

    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    
    [self loadNewsDetailData];

//    NSURL *url = [NSURL URLWithString:@"http://www.ganji.com"];
//    
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    
//    [webView loadRequest:request];
    
    
//    //2、加载本地的HTML代码
//    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"新浪" ofType:@"html"];
//    //    NSLog(@"%@", filePath);
//    
//    NSString *s = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
//    //    NSLog(@"%@", s);
//    
//    [webView loadHTMLString:s baseURL:nil];
//    
    [self.view addSubview:_webView];
    
    _indicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    
    [_indicatorView stopAnimating];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:_indicatorView];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)loadNewsDetailData
{
    NSDictionary *newsDetail = [DataService requestData:@"news_detail.json"];
    NSString *content = [newsDetail objectForKey:@"content"];
    NSString *source = [newsDetail objectForKey:@"source"];
    NSString *time = [newsDetail objectForKey:@"time"];
    NSString *author =  [newsDetail objectForKey:@"author"];
    NSString *title =  [newsDetail objectForKey:@"title"];
    
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"news" ofType:@"html"];
    NSString *html = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    //子标题：来源 时间
    NSString *subTitle = [NSString stringWithFormat:@"%@ %@",source,time];
    //编辑（作者）
    NSString *at = [NSString stringWithFormat:@"编辑(%@)",author];
    
    NSString *htmlString = [NSString stringWithFormat:html,title,subTitle,content,at];
    [_webView loadHTMLString:htmlString baseURL:nil];
    
    //自适应
    _webView.scalesPageToFit = YES;
    
    _webView.delegate = self;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [_indicatorView startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [_indicatorView stopAnimating];
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
