//
//  TopDetailModel.m
//  时光电影
//
//  Created by huiwenjiaoyu on 15/11/6.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import "TopDetailModel.h"

@implementation TopDetailModel

- (NSDictionary *)attributeMapDictionary:(NSDictionary *)jsonDic {
    
    NSDictionary *mapDic = @{
                                @"userImage":@"userImage",
                                @"nickname":@"nickname",
                                @"rating":@"rating",
                                @"content":@"content"
                                };
    return mapDic;
}

@end
