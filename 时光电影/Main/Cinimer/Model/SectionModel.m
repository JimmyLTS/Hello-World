//
//  SectionModel.m
//  时光电影
//
//  Created by 1222 on 15/11/10.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import "SectionModel.h"

@implementation SectionModel

- (NSDictionary*)attributeMapDictionary:(NSDictionary *)jsonDic
{
    NSDictionary *mapDic = @{
                             @"id":@"districtID",
                             @"name":@"districtName"
                             };
    return mapDic;
}

@end
