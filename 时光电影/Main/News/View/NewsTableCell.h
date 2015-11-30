//
//  NewsTableCell.h
//  时光电影
//
//  Created by huiwenjiaoyu on 15/11/3.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "newsModel.h"

@interface NewsTableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *newsImage;
@property (weak, nonatomic) IBOutlet UILabel *newsTitle;
@property (weak, nonatomic) IBOutlet UIImageView *iconImg;
@property (weak, nonatomic) IBOutlet UILabel *summary;
@property (nonatomic,strong) newsModel *newsModel;

@end
