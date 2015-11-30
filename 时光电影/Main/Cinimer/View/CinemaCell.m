//
//  CinemaCell.m
//  时光电影
//
//  Created by 1222 on 15/11/10.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import "CinemaCell.h"
#import "UIViewExt.h"

@implementation CinemaCell

- (void)awakeFromNib
{
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    _cinemaName.text = self.rowModel.name;
    
    _address.text = self.rowModel.address;
    
    _rating.text = self.rowModel.grade;
    _rating.right = kScreenWidth - 60;
   
    if ([_rating.text floatValue] >= 9.0) {
        _rating.textColor = [UIColor redColor];
    }
    else
    {
        _rating.textColor = [UIColor whiteColor];
    }
    _price.text = [NSString stringWithFormat:@"￥%@",self.rowModel.lowPrice];
    _price.right = kScreenWidth - 35;
    
    
    NSInteger isSeatSupport = [self.rowModel.isSeatSupport integerValue];
    NSInteger isCouponSupport = [self.rowModel.isCouponSupport integerValue];
    
    if (isSeatSupport == 1) {
        _seatImage.image = [UIImage imageNamed:@"zuo"];
    }
    
    if (isCouponSupport) {
        _ticateImage.image = [UIImage imageNamed:@"quan"];
    }
    
    _distance.right = kScreenWidth - 50;
    
}

- (void)setRowModel:(RowModel *)rowModel
{
    if (_rowModel != rowModel) {
        _rowModel = rowModel;
    }
    [self layoutSubviews];
}

@end
