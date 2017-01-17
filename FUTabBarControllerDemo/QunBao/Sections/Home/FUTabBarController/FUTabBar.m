//
//  FUTabBar.m
//  QunBao
//
//  Created by fujunzhi on 16/1/5.
//  Copyright © 2016年 FJZ. All rights reserved.
//

#import "FUTabBar.h"
#import "FUTabBarButton.h"
#import "FUTabBarHeader.h"

@interface FUTabBar ()
{
    ClickBlock _clickBlock;
}
/**
 *  存储创建的 tabBarButton
 */
@property (nonatomic, strong) NSMutableArray *tabBarButtons;
/**
 *  当前选中的 button
 */
@property (nonatomic, weak) UIButton *selectedButton;
/**
 *  添加的中心按钮
 */
@property (nonatomic, weak) FUTabBarButton *plusButton;
@property (assign, nonatomic,getter=isOffset) BOOL offset;

@end

@implementation FUTabBar

- (NSMutableArray *)tabBarButtons
{
    if (!_tabBarButtons)
    {
        self.tabBarButtons = [@[] mutableCopy];
    }
    return _tabBarButtons;
}


- (void)addCenterBtnWithIcon:(UIImage *)icon selectedIcon:(UIImage *)selected title:(NSString *)title offset:(BOOL)offset clickBlock:(ClickBlock)block
{
    _offset = offset;
    _clickBlock = block;
    FUTabBarButton *plusButton = [[FUTabBarButton alloc] init];
    [plusButton addTarget:self action:@selector(centerButtonClick) forControlEvents:UIControlEventTouchUpInside];
    UITabBarItem *plusItem = [[UITabBarItem alloc] initWithTitle:title image:icon selectedImage:selected];
    plusItem.offset = offset;
    plusButton.item = plusItem;
    
    plusButton.bounds = CGRectMake(0, 0, kCenterItemWidth, kSuperViewH + (offset ? kCenterBtnYOffset : 0));
    [self addSubview:plusButton];
    self.plusButton = plusButton;
}

// 子视图超过父视图
- (nullable UIView *)hitTest:(CGPoint)point withEvent:(nullable UIEvent *)event {
    UIView * view = [super hitTest:point withEvent:event];
    if (view == nil) {
        for (UIView * subView in self.subviews) {
            // 将坐标系转化为自己的坐标系
            CGPoint tp = [subView convertPoint:point fromView:self];
            if (CGRectContainsPoint(subView.bounds, tp)) {
                view = subView;
            }
        }
    }
    return view;
}


- (void)addTabBarButtonWithItem:(UITabBarItem *)item
{
    FUTabBarButton *tabBarButton = [[FUTabBarButton alloc] init];
    [self addSubview:tabBarButton];
    [self.tabBarButtons addObject:tabBarButton];
    //设置数据
    tabBarButton.item = item;
    [tabBarButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    //默认选中第0个按钮
    if (self.tabBarButtons.count == 1)
    {
        [self buttonClick:tabBarButton];
    }
}


//监听事件
- (void)buttonClick:(FUTabBarButton *)button
{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabbar:didSelectedButtonFrom:to:)])
    {
        [self.delegate tabbar:self didSelectedButtonFrom:self.selectedButton.tag to:button.tag];
    }
    
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
}

//设置tabBar的选中索引
- (void)selectedButtonWithIndex:(int)index
{
    for (int i = 0; i < self.tabBarButtons.count; i++)
    {
        FUTabBarButton *button = self.tabBarButtons[i];
        if (i == index)
        {
            [self buttonClick:button];
        }
    }
}


- (void)centerButtonClick
{
    if (_clickBlock) {
        _clickBlock();
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabBarDidClickedCenterButton:)])
    {
        [self.delegate tabBarDidClickedCenterButton:self];
    }
}

//布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat buttonEvenW = kSuperViewW / self.subviews.count;
    CGFloat buttonW,buttonY,buttonH;
    
    NSInteger tabBarButtonCount = self.tabBarButtons.count;
    
    for (int i = 0; i < tabBarButtonCount; i++)
    {
        //取出按钮
        FUTabBarButton *button = self.tabBarButtons[i];
        if (button.item.isOffset) {
            buttonY = -kCenterBtnYOffset;
            buttonH = kSuperViewH + kCenterBtnYOffset;
            buttonW = kCenterItemWidth;
        } else
        {
            buttonY = 0;
            buttonW = buttonEvenW;
            buttonH = kSuperViewH;
        }
        
        CGFloat buttonX = buttonEvenW * i + (buttonEvenW - buttonW) * 0.5;
        //中心按钮
        if (self.plusButton && i >= tabBarButtonCount / 2)
        {
            buttonX += buttonEvenW;
        }
        
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        button.tag = FUTabBarTag + i;
    }
    
    //中心按钮(模态)
    CGFloat centerX = kSuperViewW * 0.5 - (buttonEvenW / 2) * (tabBarButtonCount % 2);
    CGFloat centerY = self.isOffset ?  self.plusButton.frame.size.height / 2 - kCenterBtnYOffset : kSuperViewH * 0.5;
    if (tabBarButtonCount % 2)
        self.plusButton.center = CGPointMake(centerX, centerY);
    else
        self.plusButton.center = CGPointMake(kSuperViewW * 0.5, centerY);
}
@end
