//
//  FUTabBar.h
//  QunBao
//
//  Created by fujunzhi on 16/1/5.
//  Copyright © 2016年 FJZ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FUTabBar;

typedef void(^ClickBlock) (void);

#define FUTabBarTag  888888
#define FUSuperViewW  self.frame.size.width
#define FUSuperViewH  self.frame.size.height
#define FUCenterBtnYOffset FUCenterItemWidth / 2//中心按钮向上偏移

@protocol FUTabBarDelegate <NSObject>
@optional
//监听 tabBar的点击事件
- (void)tabbarAnimationView:(UIView *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to;
//中心按钮点击事件
- (void)tabBarDidClickedCenterButton:(FUTabBar *)tabBar;

@end

@interface FUTabBar : UIView
@property (nonatomic, weak)id<FUTabBarDelegate>delegate;

//接收 item创建 tabBarButton
- (void)addTabBarButtonWithItem:(UITabBarItem *)item;
- (void)addCenterBtnWithIcon:(UIImage *)icon selectedIcon:(UIImage *)selected title:(NSString *)title offset:(BOOL)offset clickBlock:(ClickBlock)block;

//设置tabBar的选中索引
- (void)selectedButtonWithIndex:(int)index;

@end

