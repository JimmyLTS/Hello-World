//
//  MovieViewController.h
//  时光网
//
//  Created by imac on 15/10/31.
//  Copyright © 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@class PosterView;

@interface MovieViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    PosterView *_posterView;
    NSMutableArray *_data;
}


@end
