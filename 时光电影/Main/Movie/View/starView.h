//
//  starView.h
//  时光网
//
//  Created by huiwenjiaoyu on 15/11/2.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface starView : UIView
{
    UIView *_goldStarView; // 金色星星
    UIView *_grayStarView; //灰色星星
}

@property (nonatomic, assign)float rating; //评分

@end
