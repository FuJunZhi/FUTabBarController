
//
//  FUTabBarHeader.h
//  QunBao
//
//  Created by fujunzhi on 2017/1/17.
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

#ifndef FUTabBarHeader_h
#define FUTabBarHeader_h

#endif /* FUTabBarHeader_h */
#import "UITabBarItem+Extension.h"
#import "UIView+TouchAreaInsets.h"
#import "NSString+size.h"
#import "UIView+FU_Animation.h"
#import "UIColor+FUFoundation.h"

//tabBarItem配置
#define FUFontSize 11 //默认文字的大小
#define FUSelectFontSize 13//选中字体大小
#define FUCenterItemWidth 60 //centerButton W
#define FUTabBarButtonTitleColor [UIColor lightGrayColor]//StateNormal
#define FUTabBarButtonSelectedTitleColor kNavColor//StateSelected
#define FUTabBarBgColor UIColorFromHex(@"#F8FCFF")

//主界面隐藏tabbar通知
#define SHOULD_HIDE_MAIN_TABBAR             @"should hide main tabbar"
//主界面显示tabbar通知
#define SHOULD_SHOW_MAIN_TABBAR             @"should show main tabbar"




