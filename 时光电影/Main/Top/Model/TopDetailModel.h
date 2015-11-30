//
//  TopDetailModel.h
//  时光电影
//
//  Created by huiwenjiaoyu on 15/11/6.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
@interface TopDetailModel : BaseModel

@property (nonatomic,copy)NSString *userImage;
@property (nonatomic,copy)NSString *nickname;
@property (nonatomic,copy)NSString *rating;
@property (nonatomic,copy)NSString *content;

@end
