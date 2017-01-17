//
//  FUTabBarController.m
//  QunBao
//
//  Created by fujunzhi on 16/11/3.
//  Copyright © 2016年 QunBao. All rights reserved.
//

#import "FUTabBarController.h"
#import "FUTabBarHeader.h"


@interface FUTabBarController ()

/**
 *  自定义的tabbar
 */
@property (nonatomic, weak) FUTabBar *myTabBar;
@property (assign, nonatomic) BOOL observeTag;

@end

@implementation FUTabBarController

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self removeObserver:self forKeyPath:@"selectedIndex" context:nil];
    [self removeObserver:self forKeyPath:@"viewControllers" context:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideTabBar:) name:SHOULD_HIDE_MAIN_TABBAR object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showTabBar:) name:SHOULD_SHOW_MAIN_TABBAR object:nil];

    //初始化 tabbar
    [self setupTabBar];
    
//    //管理子视图控制器
//    [self setUpChildControllers];
}

/**
 *  初始化tabbar
 */
- (void)setupTabBar {
    FUTabBar *myTabBar = [[FUTabBar alloc] initWithFrame:self.tabBar.bounds];
    myTabBar.backgroundColor = kTabBarBgColor;
    myTabBar.delegate = self;
    [self.tabBar addSubview:myTabBar];
    [self.tabBar bringSubviewToFront:myTabBar];
    self.myTabBar = myTabBar;
    self.tabBar.touchAreaInsets = UIEdgeInsetsMake(kCenterBtnYOffset, 0, 0, 0);
    
    // KVO 监听属性改变(tabBar的切换)
    [self addObserver:self forKeyPath:@"selectedIndex" options:NSKeyValueObservingOptionNew context:nil];
    [self addObserver:self forKeyPath:@"viewControllers" options:NSKeyValueObservingOptionNew context:nil];
}


/**
 *
 *  子类调用
 *
 *  ＃添加中心按钮（特殊样式、Modal...）
 */
- (void)addCenterItemWithIcon:(NSString *)iconName selectedIcon:(NSString *)selectedIconName title:(NSString *)title offset:(BOOL)offset clickBlock:(ClickBlock)block;
{
    [self.myTabBar addCenterBtnWithIcon:[UIImage imageNamed:iconName] selectedIcon:[UIImage imageNamed:selectedIconName] title:title offset:offset clickBlock:block];
}


//传递tabBarItem
- (void)transmitTabBarItem
{
    for (UIViewController *subViewControllview in self.viewControllers) {
        [self.myTabBar addTabBarButtonWithItem:subViewControllview.tabBarItem];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"selectedIndex"] && _observeTag) {
        [self.myTabBar selectedButtonWithIndex:[change[@"new"] intValue]];
    } else if ([keyPath isEqualToString:@"viewControllers"])
    {
        //传递 tabBarItem
        [self transmitTabBarItem];
    }
}



/**
 *  初始化一个子控制器
 *
 *  @param childVc                需要初始化的子控制器
 *  @param navigationController   导航控制器
 *  @param title                  标题
 *  @param imageName              图标
 *  @param selectedImageName      选中的图标
 *  @param offset                 是否突出偏移
 */
- (UIViewController *)setupChildViewController:(UIViewController *)childVc navigationController:(Class)navigationController title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName offset:(BOOL)offset
{
    // 1.设置控制器的属性
    childVc.title = title;
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    childVc.tabBarItem.offset = offset;
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    if (iOS7) {
        childVc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    } else {
        childVc.tabBarItem.selectedImage = selectedImage;
    }
    
    // 2.包装一个导航控制器
    UINavigationController *naVc = [[navigationController alloc] initWithRootViewController:childVc];
    
    return naVc;
}



#pragma mark - <FUTabBarDelegate>
//监听 tabBar按钮改变
- (void)tabbar:(FUTabBar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to {
    _observeTag = NO; //防止KVO执行多次
    self.selectedIndex = to - FUTabBarTag;
    _observeTag = YES;
    
    //删除自带tabBarButton
    [self hideTabBarSubViews];
}

////中心按钮点击事件
//- (void)tabBarDidClickedCenterButton:(FUTabBar *)tabBar
//{
//    /**
//     *  子类去实现
//     */
//}


#pragma mark - 显示、隐藏tabBar
- (void) hideTabBar:(NSNotification *)noti
{
    [self hideTabBarSubViews];
    self.tabBar.hidden = YES;
}

- (void) showTabBar:(NSNotification *)noti
{
    [self hideTabBarSubViews];
    self.tabBar.hidden = NO;
}


- (void) hideTabBarSubViews
{
    [self.tabBar.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[UIControl class]])
        {
            [obj removeFromSuperview];
        }
    }];
}

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    [self hideTabBarSubViews];
//}

////添加子视图控制器
//- (void) setUpChildControllers
//{
//    /**
//     *  子类去实现
//     */
//}

@end
