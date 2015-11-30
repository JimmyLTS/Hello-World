//
//  MyNavigationController.m
//  时光网
//
//  Created by imac on 15/10/31.
//  Copyright © 2015年 imac. All rights reserved.
//

#import "MyNavigationController.h"

@interface MyNavigationController ()

@end

@implementation MyNavigationController

- (UIStatusBarStyle)preferredStatusBarStyle
{
//    UIStatusBarStyle style = [self.topViewController preferredStatusBarStyle];
//    return style;
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDictionary *textAtt = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    
    self.navigationBar.titleTextAttributes= textAtt;
    
    self.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
