//
//  RowModel.h
//  时光电影
//
//  Created by 1222 on 15/11/10.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import "BaseModel.h"

@interface RowModel : BaseModel
@property (nonatomic,copy)NSString *lowPrice;
@property (nonatomic,copy)NSString *grade;
@property (nonatomic,copy)NSString *address;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *cinemaID;
@property (nonatomic,copy)NSString *districtId;
@property (nonatomic,copy)NSString *tel;
@property (nonatomic,copy)NSString *circleName;
@property (nonatomic,strong)NSNumber *isSeatSupport;
@property (nonatomic,strong)NSNumber *isCouponSupport;
@end
