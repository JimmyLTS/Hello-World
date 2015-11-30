//
//  Movie.h
//  时光网
//
//  Created by huiwenjiaoyu on 15/11/2.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic,strong)NSNumber *average;
@property (nonatomic,copy) NSDictionary *images;
@property (nonatomic,copy) NSString *original_title;
@property (nonatomic,copy) NSString *subtype;
@property (nonatomic,copy) NSString *year;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *movieID;
@property (nonatomic,strong)NSNumber *collect_count;

@end
