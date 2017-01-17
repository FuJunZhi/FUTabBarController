//
//  MineColumnCell.m
//  QunBao
//
//  Created by fujunzhi on 16/1/6.
//  Copyright © 2016年 QunBao. All rights reserved.
//

#import "MineColumnCell.h"
#import "MineColumnModel.h"

@implementation MineColumnCell

- (void)awakeFromNib {
    // Initialization code
}

//返回cell
+ (instancetype) cellWithTableView:(UITableView *)tableView
{
    static NSString *identifer = @"MineColumnCell";
    MineColumnCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MineColumnCell" owner:nil options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}


- (void)setModel:(MineColumnModel *)model
{
    _model = model;
    self.iconImageView.image = [UIImage imageNamed:self.model.iconName];
    self.titleLabel.text = self.model.title;
    if ([self.model.title isEqualToString:@"系统消息"]) {
        self.switchView.hidden = NO;
        self.arrowImageView.hidden = YES;
    }
}

@end












