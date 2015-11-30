//
//  CinemaCell.h
//  时光电影
//
//  Created by 1222 on 15/11/10.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RowModel.h"

@interface CinemaCell : UITableViewCell
@property (nonatomic,strong)RowModel *rowModel;
@property (weak, nonatomic) IBOutlet UILabel *cinemaName;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *rating;
@property (weak, nonatomic) IBOutlet UILabel *distance;
@property (weak, nonatomic) IBOutlet UIImageView *seatImage;
@property (weak, nonatomic) IBOutlet UIImageView *ticateImage;
@end
