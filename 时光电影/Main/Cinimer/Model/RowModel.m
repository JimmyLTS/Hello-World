//
//  RowModel.m
//  时光电影
//
//  Created by 1222 on 15/11/10.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import "RowModel.h"

@implementation RowModel

- (void)setAttributes:(NSDictionary *)jsonDic
{
    [super setAttributes:jsonDic];
    self.cinemaID = [jsonDic objectForKey:@"id"];
}

@end
