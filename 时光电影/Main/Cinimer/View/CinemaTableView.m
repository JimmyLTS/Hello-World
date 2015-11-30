//
//  CinemaTableView.m
//  时光电影
//
//  Created by 1222 on 15/11/10.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import "CinemaTableView.h"
#import "CinemaCell.h"
#import "SectionModel.h"
#import "RowModel.h"
#import "UIViewExt.h"
#define kSectionHeight kScreenHeight/18


@implementation CinemaTableView
{
    NSMutableArray *_array;
    BOOL _showSection[20];
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    for (int i=0; i<_sectionData.count; i++) {
        _showSection[i] = NO;
    }
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.rowHeight = 100;
    }
    return self;
}


#pragma mark - 数据源方法、代理方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _sectionData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_showSection[section] == NO) {
        return 0;
    }
    return [_numOfRow[section] integerValue];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CinemaCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CinemaCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"CinemaCell" owner:self options:nil]lastObject];
    }
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (int i = 0; i<_rowData.count; i++) {
        RowModel *rowModel =  _rowData[i];
        SectionModel *secModel = _sectionData[indexPath.section];
        if (rowModel.districtId == secModel.districtID) {
            [array addObject:rowModel];
        }
    }
    cell.rowModel = array[indexPath.row];
    return cell;
}

#pragma mark - 设置头视图
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kSectionHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIControl *control = [[UIControl alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kSectionHeight)];
    control.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bt_bg"]];
    
    UILabel *headerView = [[UILabel alloc]initWithFrame:control.bounds];
    headerView.left = 10;
    SectionModel *sectionModel = _sectionData[section];
    headerView.text = sectionModel.districtName;
    headerView.textColor = [UIColor whiteColor];
    headerView.backgroundColor = [UIColor clearColor];
    [control addSubview:headerView];
    
    control.tag = section;
    [control addTarget:self action:@selector(controlAction:) forControlEvents:UIControlEventTouchUpInside];
    
    return control;
}

- (void)controlAction:(UIControl *)control
{
    NSInteger section = control.tag;
    for (int i = 0; i<_sectionData.count; i++) {
        if (_showSection[i] == YES && i != section ) {
            _showSection[i] = NO;
            [self reloadSections:[NSIndexSet indexSetWithIndex:i] withRowAnimation:UITableViewRowAnimationFade];
        }
    }
    _showSection[section] = !_showSection[section];

    
    [self reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationFade];
}

@end
