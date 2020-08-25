# FUTabBarController
*Custom FUTabBarController
包括功能：选中按钮动画（缩放／旋转）、选中字体可以改变大小颜色、所有按钮都可以凸起、自定义push/模态跳转、角标的自定义


### CocoaPods

  1. Add `pod 'FUTabBarController', '~> 2.0.1'` to your Podfile.

  2. Run `pod install` or `pod update`.

  3. 创建UITabBarController自定义类 继承FUTabBarController
  4. 具体实现可以看demo`Home->MainTabBarController.m`
  

### 带动画的效果图
<img src="https://github.com/FuJunZhi/FUResources/blob/master/Images/FUTabar.gif" width="30%" height="30%">
<img src="https://github.com/FuJunZhi/FUResources/blob/master/Images/FUTabar1.gif" width="30%" height="30%">

### 根据有无标题、是否凸出有四种效果
<img src="https://github.com/FuJunZhi/FUResources/blob/master/Images/FUTabar2.png" width="30%" height="30%">
<img src="https://github.com/FuJunZhi/FUResources/blob/master/Images/FUTabar3.png" width="30%" height="30%">
<img src="https://github.com/FuJunZhi/FUResources/blob/master/Images/FUTabar4.png" width="30%" height="30%">
<img src="https://github.com/FuJunZhi/FUResources/blob/master/Images/FUTabar5.png" width="30%" height="30%">


### 父类中提供的方法
## <a id="initialize"></a>
```objc
/**
* TabBarSelectAnimationDefault = 0, //无动画
* TabBarSelectAnimationScale,       //缩放动画
* TabBarSelectAnimationRotate       //旋转动画 
*/
@property (nonatomic, assign) TabBarSelectAnimation selectAnimation;

/**
*  初始化一个子控制器
*
*  @param childVc               需要初始化的子控制器
*  @param navigationController  导航控制器
*  @param title                 标题
*  @param imageName             图标
*  @param selectedImageName     选中的图标
*  @param offset                是否凸出（YES：按钮向上凸出）
*/
- (UIViewController *)setupChildViewController:(UIViewController *)childVc navigationController:(Class)navigationController title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName offset:(BOOL)offset;

//添加中心按钮：模态...（子类调用）
- (void)addCenterItemWithIcon:(NSString *)iconName selectedIcon:(NSString *)selectedIconName title:(NSString *)title offset:(BOOL)offset clickBlock:(ClickBlock)block;
@end
```


# 子类中给viewControllers赋值就可以了
## <a id="setup"></a>
```objc
- (void) setUpChildControllers
{
//动态
UIStoryboard *trendsStB = [UIStoryboard storyboardWithName:@"TrendsViewController" bundle:nil];
TrendsViewController *trendsVC = [trendsStB instantiateViewControllerWithIdentifier:@"TrendsViewController"];
[self setupChildViewController:trendsVC navigationController:[MainNavController class] title:@"动态" imageName:@"trends_nomal.png" selectedImageName:@"trends_select.png" offset:NO];

//名片
UIStoryboard *callingCardStB = [UIStoryboard storyboardWithName:@"CallingCardViewController" bundle:nil];
CallingCardViewController *callingCardVC = [callingCardStB instantiateViewControllerWithIdentifier:@"CallingCardViewController"];
[self setupChildViewController:callingCardVC navigationController:[MainNavController class] title:@"名片" imageName:@"callingCard_nomal.png" selectedImageName:@"callingCard_select.png" offset:NO];

//宝信
UIStoryboard *baoXinStB = [UIStoryboard storyboardWithName:@"BaoXunViewController" bundle:nil];
BaoXunViewController *baoXinVC = [baoXinStB instantiateViewControllerWithIdentifier:@"BaoXunViewController"];
[self setupChildViewController:baoXinVC navigationController:[MainNavController class] title:@"宝信" imageName:@"baoxin_nomal.png" selectedImageName:@"baoxin_select.png" offset:NO];

//我的
UIStoryboard *mineStB = [UIStoryboard storyboardWithName:@"MineViewController" bundle:nil];
MineViewController *mineVC = [mineStB instantiateViewControllerWithIdentifier:@"MineViewController"];
[self setupChildViewController:mineVC navigationController:[MainNavController class] title:@"我的" imageName:@"mine_nomal.png" selectedImageName:@"mine_select.png" offset:NO];

//添加动画
self.selectAnimation = TabBarSelectAnimationScale;

//添加中心按钮
__weak typeof(self) weakSelf = self;
[self addCenterItemWithIcon:@"search_nomal" selectedIcon:@"search_nomal" title:@"搜索" offset:YES clickBlock:^{
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"SearchViewController" bundle:nil];
    SearchViewController *searchVC = [board instantiateViewControllerWithIdentifier:@"SearchViewController"];
    [weakSelf presentViewController:[[MainNavController alloc] initWithRootViewController:searchVC] animated:YES completion:nil];
}];

@end
```
