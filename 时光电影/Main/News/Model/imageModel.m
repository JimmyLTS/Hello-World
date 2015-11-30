//
//  imageModel.m
//  时光电影
//
//  Created by huiwenjiaoyu on 15/11/5.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import "imageModel.h"

@implementation imageModel

- (NSDictionary*)attributeMapDictionary:(NSDictionary *)jsonDic
{
    NSDictionary *mapDic = @{
                             @"id":@"newsID",
                             @"image":@"image",
                             @"type" : @"type"
                             };
    return mapDic;
}
//- (void)setAttributes:(NSDictionary *)jsonDic
//{
//    [super setAttributes:jsonDic];
//    
//    self.newsId = [jsonDic objectForKey:@"id"];
//}

@end
