//
//  MineViewController.m
//  QunBao
//
//  Created by fujunzhi on 16/1/5.
//  Copyright © 2016年 QunBao. All rights reserved.
//

#import "MineViewController.h"
#import "MineColumnCell.h"
#import "MineColumnModel.h"
#import "UIView+Frame.h"

#define kFirst_Cell_Height 80    //first Cell H
#define kOther_Cell_Height 45    //Other Cell H
#define kLogOut_Btn_Height 50    //btn H
#define kLogOut_Btn_LeftSpace 30 //btn x
#define kFooterView_Height (kLogOut_Btn_LeftSpace * 2 + kLogOut_Btn_Height)          //footerView H

@interface MineViewController ()<UITableViewDataSource, UITableViewDelegate>
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.columnNumber = 0;
    //配置TabView
    [self setUpTableView];
}


- (void) setUpTableView
{
    self.tableView.scrollEnabled = NO;
    self.tableView.contentOffset = CGPointMake(0, 64);
    UIView *footerView = [[UIView alloc] init];
    UIButton *logOutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    logOutBtn.frame  = CGRectMake(kLogOut_Btn_LeftSpace, kLogOut_Btn_LeftSpace, kScreenWidth - kLogOut_Btn_LeftSpace * 2, kLogOut_Btn_Height);
    [footerView setHeight:kFooterView_Height];
    [logOutBtn setBackgroundImage:[UIImage imageNamed:@"btn_user"] forState:UIControlStateNormal];
    [logOutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    [logOutBtn setTitleColor:[kMainSingleton colorWithHexString:@"#ff0033" alpha:1] forState:UIControlStateNormal];
    [footerView addSubview:logOutBtn];
    self.tableView.tableFooterView = footerView;
}


/**
 *  懒加载
 *
 *  @return 数据源
 */
- (NSArray *)dataSourceArr
{
    if (!_dataSourceArr) {
        NSArray *columnArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ColumnDetail" ofType:@"plist"]];
        NSMutableArray *sectionArr = [@[] mutableCopy];
        for (NSArray *arr in columnArr) {
            NSMutableArray *rowArr = [@[] mutableCopy];
            for (NSDictionary *dic in arr) {
                MineColumnModel *columnDodel = [MineColumnModel mineColumnModelWithDic:dic];
                self.columnNumber++;
                [rowArr addObject:columnDodel];
            }
            [sectionArr addObject:rowArr];
        }
        self.dataSourceArr = [NSArray arrayWithArray:sectionArr];
    }
    return _dataSourceArr;
}


#pragma mark - <UITableViewDelegate>
//行高
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.section ? kOther_Cell_Height : kFirst_Cell_Height;
}

//分区页眉高
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return section ? (self.tableView.h - 64 - kFooterView_Height - kFirst_Cell_Height - (self.columnNumber - 1) * kOther_Cell_Height) / (self.dataSourceArr.count - 1) : 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

//分区页眉
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view=[[UIView alloc] initWithFrame:CGRectZero];
    view.backgroundColor = [UIColor clearColor];
    return view;
}
- (UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view=[[UIView alloc] initWithFrame:CGRectZero];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

//cell点击事件
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - <UITableViewDataSource>
//分区行数
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataSourceArr[section] count];
}
//分区数
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSourceArr.count;
}
//cell
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MineColumnCell *cell = [MineColumnCell cellWithTableView:tableView];
    cell.model = self.dataSourceArr[indexPath.section][indexPath.row];
    return cell;
}


@end













