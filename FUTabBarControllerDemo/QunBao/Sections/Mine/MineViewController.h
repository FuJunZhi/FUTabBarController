//
//  MineViewController.h
//  QunBao
//
//  Created by fujunzhi on 16/1/5.
//  Copyright © 2016年 QunBao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineViewController : UIViewController
/**
 *  tableView
 */
@property (weak, nonatomic) IBOutlet UITableView *tableView;
/**
 *  数据源
 */
@property (strong, nonatomic) NSArray *dataSourceArr;
/**
 *  栏目数
 */
@property (assign, nonatomic) NSInteger columnNumber;
@end
