//
//  PhotoCell.h
//  时光电影
//
//  Created by huiwenjiaoyu on 15/11/6.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoScroll.h"
@interface PhotoCell : UICollectionViewCell
@property (nonatomic ,copy)NSString *urlString;
@property (nonatomic,strong)PhotoScroll *scroll;
@end
