//
//  FUTabBarController.h
//  FUTabBarController
//
//  Created by fujunzhi on 16/11/3.
//  Copyright (c) 2016 FUTabBarController (https://github.com/FuJunZhi/FUTabBarController.git)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import <UIKit/UIKit.h>
#import "FUTabBar.h"
#define FUIsNetworkImage(imageFile) ([imageFile hasPrefix:@"http"] || [imageFile hasPrefix:@"https"])

typedef NS_ENUM(NSInteger,TabBarSelectAnimation) {
    TabBarSelectAnimationDefault = 0, //无动画
    TabBarSelectAnimationScale,       //缩放动画
    TabBarSelectAnimationRotate       //旋转动画
};

@interface FUTabBarController : UITabBarController<FUTabBarDelegate>
//默认无动画
@property (nonatomic, assign) TabBarSelectAnimation selectAnimation;

/**
 *  初始化一个子控制器
 *
 *  @param childVc              需要初始化的子控制器
 *  @param navigationController 导航控制器
 *  @param title                标题
 *  @param imageName            图标
 *  @param selectedImageName    选中的图标
 *  @param offset               是否突出偏移
 */
- (void)setupChildViewController:(UIViewController *)childVc navigationController:(Class)navigationController title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName offset:(BOOL)offset;

//添加中心按钮：特殊样式、Modal...（子类调用）
- (void)addCenterItemWithIcon:(NSString *)iconName selectedIcon:(NSString *)selectedIconName title:(NSString *)title offset:(BOOL)offset clickBlock:(FUClickBlock)block;

@end

@interface UIViewController (FUViewController)
//跳转时隐藏tabbar
@property (nonatomic, assign,getter=isHidesFUTabBarWhenPushed) BOOL hidesFUTabBarWhenPushed;
//跳转次数
@property (nonatomic, assign) NSInteger pushNumber;
@property (nonatomic, assign,getter=isShowCloseBtn) BOOL showCloseBtn;
@end


@interface NSObject (RemoveObserver)
@end
