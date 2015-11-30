//
//  TopDetailController.m
//  时光电影
//
//  Created by huiwenjiaoyu on 15/11/6.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import "TopDetailController.h"
#import "DataService.h"
#import "TopDetailModel.h"
#import "MovieCommentCell.h"
#import "UIImageView+WebCache.h"
#import "UIViewExt.h"
#define kCellHeight 80
#define kContentTextHeight  25
#define kContentTextWidth  kScreenWidth-100

@interface TopDetailController ()
{
    NSMutableDictionary *selectedIndexes;
    MovieCommentCell *mCell;
}

@end

@implementation TopDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:61/255.0 green:112/255.0 blue:244/255.0 alpha:1];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
//    _tableView.rowHeight = kCellHeight;
    _tableView.frame = self.view.bounds;
    
    [self _loadContentData];
    [self _loadDetailData];
    
    [self loadHeadView];
    
    selectedIndexes = [[NSMutableDictionary alloc]init];
}
#pragma mark - 加载数据

- (void)_loadDetailData
{
    NSDictionary *dic1 = [DataService requestData:@"movie_detail.json"];
    _firstModel = [[FirstModel alloc]initContentWithDic:dic1];
    _imageData = [dic1 objectForKey:@"videos"];
}

- (void)_loadContentData
{
    NSDictionary *dic2 = [DataService requestData:@"movie_comment.json"];
    NSArray *array = [dic2 objectForKey:@"list"];
    _data = [[NSMutableArray alloc]initWithCapacity:array.count];
    for (NSDictionary *dic3 in array) {
        TopDetailModel *topDetail = [[TopDetailModel alloc]initContentWithDic:dic3];
        [_data addObject:topDetail];
    }
    [_tableView reloadData];
}

- (void)loadHeadView
{
    //mainImage
    [self.mainImage sd_setImageWithURL:[NSURL URLWithString:self.firstModel.image]];
    
    //titleCn
    self.titleCn.text = self.firstModel.titleCn;
    _titleCn.width = kScreenWidth-140;
    
    //titleEn
    self.titleEn.text = self.firstModel.titleEn;
    _titleEn.width = kScreenWidth-140;
    
    //四张小图
    for (int i=201; i<205; i++) {
        UIImageView *imageView = (UIImageView *)[self.view viewWithTag:i];
        
        CGFloat f = (kScreenWidth - 70*4)/5;
        imageView.right = (70+f)*(i-200);
        
        NSString *url = [_imageData[i-201] objectForKey:@"image"];
        [imageView sd_setImageWithURL:[NSURL URLWithString:url]];
        
        
    }
    
    _scroll.width = _titleEn.width = kScreenWidth-140;
    _content.width = _scroll.width;
    //content
    self.content.numberOfLines = 0;
    self.content.text = self.firstModel.content;
    [self.content sizeToFit];
    self.scroll.contentSize = self.content.bounds.size;
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MovieCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCommentCell" forIndexPath:indexPath];
    cell.topDetail = _data[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.content.width = kContentTextWidth;
    cell.content.height = kContentTextHeight;

    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (![self cellIsSelected:indexPath]) {
        mCell = [tableView cellForRowAtIndexPath:indexPath];
        mCell.content.numberOfLines = 0;
        [mCell.content sizeToFit];
    
        BOOL isSelected = ![self cellIsSelected:indexPath];
        NSNumber *selectedIndex = [NSNumber numberWithBool:isSelected];
        [selectedIndexes setObject:selectedIndex forKey:indexPath];

        [self.tableView beginUpdates];
        [self.tableView endUpdates];
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BOOL isSelected = ![self cellIsSelected:indexPath];
    NSNumber *selectedIndex = [NSNumber numberWithBool:isSelected];
    [selectedIndexes setObject:selectedIndex forKey:indexPath];
    mCell.content.height = kContentTextHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self cellIsSelected:indexPath]) {
        return kCellHeight - kContentTextHeight + mCell.content.height;
    }
    return kCellHeight;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(MovieCommentCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    BOOL isSelected = [self cellIsSelected:indexPath];
    if (isSelected) {
        isSelected = !isSelected;
        NSNumber *selectedIndex = [NSNumber numberWithBool:isSelected];
        [selectedIndexes setObject:selectedIndex forKey:indexPath];
    }
}

- (BOOL)cellIsSelected:(NSIndexPath *)indexPath
{
    NSNumber *selectedIndex = [selectedIndexes objectForKey:indexPath];
    return selectedIndex == nil ? FALSE : [selectedIndex boolValue];
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
