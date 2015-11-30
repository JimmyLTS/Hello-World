//
//  TopDetailController.h
//  时光电影
//
//  Created by huiwenjiaoyu on 15/11/6.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstModel.h"

@interface TopDetailController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong)NSMutableArray *data;
@property (nonatomic,strong)NSArray *imageData;
@property (nonatomic,strong)FirstModel *firstModel;
@property (weak, nonatomic) IBOutlet UIImageView *mainImage;
@property (weak, nonatomic) IBOutlet UILabel *titleCn;
@property (weak, nonatomic) IBOutlet UILabel *titleEn;
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;
@property (strong, nonatomic) IBOutlet UILabel *content;

@end
