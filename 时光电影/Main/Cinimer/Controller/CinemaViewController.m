//
//  CinemaViewController.m
//  时光电影
//
//  Created by 1222 on 15/11/10.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import "CinemaViewController.h"
#import "DataService.h"
#import "SectionModel.h"
#import "RowModel.h"

@implementation CinemaViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    // Do any additional setup after loading the view.
    [self _loadSectionData];
    [self _loadRowData];
    [self rowCountInSection];
    [self _creatTableView];
    
}
#pragma mark - 创建 tableView
- (void)_creatTableView
{
    _tableView = [[CinemaTableView alloc]initWithFrame:CGRectMake(5, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor clearColor];
     _tableView.sectionData = _sectionData;
    _tableView.rowData = _rowData;
    _tableView.numOfRow = _numOfRow;
    [_tableView reloadData];
    [self.view addSubview:_tableView];
}

#pragma mark - 每组的单元格数
- (void)rowCountInSection
{
    _numOfRow = [[NSMutableArray alloc]init];
    for (int i=0; i<_sectionData.count; i++) {
        NSInteger numOfRow = 0;
        SectionModel *section = _sectionData[i];
        for (int j=0; j<_rowData.count; j++) {
            RowModel *rowModel = _rowData[j];
            NSString *secDisID = section.districtID;
            NSString *rowDisId = rowModel.districtId;
            if (secDisID == rowDisId) {
                numOfRow++;
            }
        }
        NSString *rowNum = [NSString stringWithFormat:@"%li",numOfRow];
        [_numOfRow addObject:rowNum];
    }
}

#pragma mark - 加载数据
- (void)_loadSectionData
{
    NSDictionary *dic = [DataService requestData:@"district_list.json"];
    NSArray *array = [dic objectForKey:@"districtList"];
    _sectionData = [[NSMutableArray alloc]initWithCapacity:array.count];
    for (NSDictionary *dic2 in array) {
        SectionModel *section = [[SectionModel alloc]initContentWithDic:dic2];
        [_sectionData addObject:section];
    }
}

- (void)_loadRowData
{
    NSDictionary *dic = [DataService requestData:@"cinema_list.json"];
    NSArray *array = [dic objectForKey:@"cinemaList"];
    _rowData = [[NSMutableArray alloc]initWithCapacity:array.count];
    for (NSDictionary *dic2 in array) {
        RowModel *row = [[RowModel alloc]initContentWithDic:dic2];
        [_rowData addObject:row];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
