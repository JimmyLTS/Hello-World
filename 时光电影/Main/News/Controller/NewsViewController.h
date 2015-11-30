//
//  NewsViewController.h
//  时光网
//
//  Created by imac on 15/10/31.
//  Copyright © 2015年 imac. All rights reserved.
//

#import "BaseViewController.h"

@interface NewsViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *newsTable;
@property (nonatomic,strong) NSMutableArray *data;
@end
