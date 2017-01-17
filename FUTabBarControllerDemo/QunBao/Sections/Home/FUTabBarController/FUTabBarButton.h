//
//  FUTabBarButton.h
//  QunBao
//
//  Created by fujunzhi on 16/1/5.
//  Copyright © 2016年 FJZ. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kTabBarButtonImageRatio 0.5

@interface FUTabBarButton : UIButton
/**
 *  赋值
 */
@property (nonatomic, strong) UITabBarItem *item;
@end
