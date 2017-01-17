//
//  TrendsViewController.m
//  QunBao
//
//  Created by fujunzhi on 16/1/5.
//  Copyright © 2016年 QunBao. All rights reserved.
//

#import "TrendsViewController.h"
#import "CallingCardViewController.h"

@interface TrendsViewController ()

@end

@implementation TrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//更改角标
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarItem.badgeValue = @"28";
}
//切换标签
- (IBAction)aaaa:(id)sender {
    self.tabBarController.selectedIndex = 2;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tabBarItem.badgeValue = @"100";
    
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
