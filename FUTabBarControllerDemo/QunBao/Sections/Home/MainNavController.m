//
//  MainNavController.m
//  QunBao
//
//  Created by fujunzhi on 16/1/5.
//  Copyright © 2016年 QunBao. All rights reserved.
//

#import "MainNavController.h"

@interface MainNavController ()

@end

@implementation MainNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINavigationBar *bar = [UINavigationBar appearance];

    //设置导航条背景颜色
    [bar setBarTintColor:kNavColor];
    [bar setBackgroundColor:kNavColor];
    [bar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    
    //设置标题字体属性
    NSDictionary *titleTextAttributes = @{
                                          NSFontAttributeName : [UIFont systemFontOfSize:18],
                                          NSForegroundColorAttributeName : [UIColor whiteColor]
                                          };
    [bar setTitleTextAttributes:titleTextAttributes];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

}

@end
