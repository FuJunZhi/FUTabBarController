//
//  MainTabBarController.m
//  QunBao
//
//  Created by fujunzhi on 16/11/3.
//  Copyright © 2016年 QunBao. All rights reserved.
//

#import "MainTabBarController.h"
#import "MainNavController.h"
#import "TrendsViewController.h"
#import "CallingCardViewController.h"
#import "SearchViewController.h"
#import "BaoXunViewController.h"
#import "MineViewController.h"

@interface MainTabBarController ()
@end

@implementation MainTabBarController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpChildControllers];
}



- (void) setUpChildControllers
{
    //动态
    UIStoryboard *trendsStB = [UIStoryboard storyboardWithName:@"TrendsViewController" bundle:nil];
    TrendsViewController *trendsVC = [trendsStB instantiateViewControllerWithIdentifier:@"TrendsViewController"];
    [self setupChildViewController:trendsVC navigationController:[MainNavController class] title:@"动态" imageName:@"trends_nomal.png" selectedImageName:@"trends_select.png" offset:NO];
    
    //名片
    UIStoryboard *callingCardStB = [UIStoryboard storyboardWithName:@"CallingCardViewController" bundle:nil];
    CallingCardViewController *callingCardVC = [callingCardStB instantiateViewControllerWithIdentifier:@"CallingCardViewController"];
    [self setupChildViewController:callingCardVC navigationController:[MainNavController class] title:@"名片" imageName:@"callingCard_nomal.png" selectedImageName:@"callingCard_select.png" offset:NO];
    
    //宝信
    UIStoryboard *baoXinStB = [UIStoryboard storyboardWithName:@"BaoXunViewController" bundle:nil];
    BaoXunViewController *baoXinVC = [baoXinStB instantiateViewControllerWithIdentifier:@"BaoXunViewController"];
    [self setupChildViewController:baoXinVC navigationController:[MainNavController class] title:@"宝信" imageName:@"msg_nomal.png" selectedImageName:@"msg_select.png" offset:NO];
    
    //我的
    UIStoryboard *mineStB = [UIStoryboard storyboardWithName:@"MineViewController" bundle:nil];
    MineViewController *mineVC = [mineStB instantiateViewControllerWithIdentifier:@"MineViewController"];
    [self setupChildViewController:mineVC navigationController:[MainNavController class] title:@"我的" imageName:@"mine_nomal.png" selectedImageName:@"mine_select.png" offset:NO];
    
    //添加动画
    self.selectAnimation = TabBarSelectAnimationScale;
    
    //添加中心按钮
    __weak typeof(self) weakSelf = self;
    [self addCenterItemWithIcon:@"search_nomal" selectedIcon:@"search_nomal" title:@"搜索" offset:YES clickBlock:^{
        UIStoryboard *board = [UIStoryboard storyboardWithName:@"SearchViewController" bundle:nil];
        SearchViewController *searchVC = [board instantiateViewControllerWithIdentifier:@"SearchViewController"];
        [weakSelf presentViewController:[[MainNavController alloc] initWithRootViewController:searchVC] animated:YES completion:nil];
    }];
    
    
}


@end




