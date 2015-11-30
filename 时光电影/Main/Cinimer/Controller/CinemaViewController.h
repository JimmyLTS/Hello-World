//
//  CinemaViewController.h
//  时光电影
//
//  Created by 1222 on 15/11/10.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import "BaseViewController.h"
#import "CinemaTableView.h"

@interface CinemaViewController : BaseViewController
@property (nonatomic,strong)NSMutableArray *sectionData;
@property (nonatomic,strong)NSMutableArray *rowData;
@property (nonatomic,strong)NSMutableArray *numOfRow;
@property (nonatomic,strong)CinemaTableView *tableView;
@end
