//
//  USMovieCell.h
//  时光网
//
//  Created by huiwenjiaoyu on 15/11/2.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class starView;
@class Movie;
@interface USMovieCell : UITableViewCell
@property (nonatomic,weak)Movie *movie;
@property (weak, nonatomic) IBOutlet UIImageView *imaView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *rating;
@property (weak, nonatomic) IBOutlet UILabel *year;
@property (weak, nonatomic) IBOutlet starView *starView;


@end
