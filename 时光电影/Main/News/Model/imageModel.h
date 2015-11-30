//
//  imageModel.h
//  时光电影
//
//  Created by huiwenjiaoyu on 15/11/5.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
@interface imageModel : BaseModel

@property(nonatomic,strong)NSNumber *newsId;
@property(nonatomic,strong)NSNumber *type;
@property(nonatomic,copy)NSString *image;

@end
