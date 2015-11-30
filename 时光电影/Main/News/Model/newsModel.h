//
//  newsModel.h
//  时光电影
//
//  Created by huiwenjiaoyu on 15/11/3.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface newsModel : NSObject

@property(nonatomic,strong)NSNumber *newsId;
@property(nonatomic,strong)NSNumber *type;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *summary;
@property(nonatomic,copy)NSString *image;

@end
