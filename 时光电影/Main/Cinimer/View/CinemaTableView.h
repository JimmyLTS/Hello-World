//
//  CinemaTableView.h
//  时光电影
//
//  Created by 1222 on 15/11/10.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CinemaTableView : UITableView <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)NSArray *sectionData;
@property (nonatomic,strong)NSArray *rowData;
@property (nonatomic,strong)NSArray *numOfRow;
@end
