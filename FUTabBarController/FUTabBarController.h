//
//  FUTabBarController.h
//  QunBao
//
//  Created by fujunzhi on 16/11/3.
//  Copyright © 2016年 QunBao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FUTabBar.h"

@interface FUTabBarController : UITabBarController<FUTabBarDelegate>

//添加中心按钮：特殊样式、Modal...（子类调用）
- (void)addCenterItemWithIcon:(NSString *)iconName selectedIcon:(NSString *)selectedIconName title:(NSString *)title offset:(BOOL)offset clickBlock:(ClickBlock)block;
/**
 *  初始化一个子控制器
 *
 *  @param childVc           需要初始化的子控制器
 *  @param childVc           导航控制器
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 *  @param selectedImageName 是否突出偏移
 */
- (UIViewController *)setupChildViewController:(UIViewController *)childVc navigationController:(Class)navigationController title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName offset:(BOOL)offset;

@end
