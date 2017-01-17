//
//  MineColumnCell.h
//  QunBao
//
//  Created by fujunzhi on 16/1/6.
//  Copyright © 2016年 QunBao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MineColumnModel;

@interface MineColumnCell : UITableViewCell
/**
 *  图标
 */
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
/**
 *  标题
 */
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
/**
 *  模型
 */
@property (strong, nonatomic) MineColumnModel *model;
/**
 *  选择图标
 */
@property (weak, nonatomic) IBOutlet UISwitch *switchView;
/**
 *  箭头图标
 */
@property (weak, nonatomic) IBOutlet UIImageView *arrowImageView;

+ (instancetype) cellWithTableView:(UITableView *)tableView;
@end
