//
//  LunchViewController.m
//  时光电影
//
//  Created by 1222 on 15/11/10.
//  Copyright © 2015年 Jimmy. All rights reserved.
//

#import "LunchViewController.h"
#import "UIViewExt.h"

@implementation LunchViewController
{
    NSMutableArray *_imageArray;
}

static NSInteger _index = 0;

- (void)viewDidLoad
{
    UIImageView *imaView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    imaView.image = [UIImage imageNamed:@"bg.jpg"];
    [self.view addSubview:imaView];
    
    _imageArray = [[NSMutableArray alloc]init];
    
    [self _loadImages];
    [self _startAnimation];
    
}

- (void)_loadImages
{
    int count = 16;
    
    CGFloat imageWidth = kScreenWidth/4;
    CGFloat imageHeight = kScreenHeight/6;
    
    int x=0,y=0;
    
    for (int i = 0; i<count; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, imageWidth, imageHeight)];
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%i",i+1]];
        imageView.image = image;
        imageView.alpha = 0;
        
        [self.view addSubview:imageView];
        
        if (i<=3) {
            y=0;
            x=i*imageWidth;
        }
        else if (i<=7)
        {
            x = imageWidth*3;
            y = (i-3)*imageHeight;
        }
        else if (i<=11)
        {
            y = kScreenHeight - imageHeight;
            x = (11-i)*imageWidth;
        }
        else if (i<16)
        {
            x = 0;
            y = (16 - i) *imageHeight;
        }
        
        imageView.origin = CGPointMake(x, y);
        [_imageArray addObject:imageView];
    }
}

- (void)_startAnimation
{
    if (_index >= _imageArray.count) {
        [self _showMain];
        return;
    }
   
    UIImageView *imageView = _imageArray[_index];
    imageView.alpha = 0;
    
    [UIView animateWithDuration:0.2
                     animations:^{
                         imageView.alpha = 1;
                     }];
    _index++;
    
    [self performSelector:@selector(_startAnimation) withObject:nil afterDelay:0.2];
    
}

- (void)_showMain
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController *viewController = [storyboard instantiateInitialViewController];
    
    UIWindow *window = self.view.window;
    
    window.rootViewController = viewController;
}

@end
