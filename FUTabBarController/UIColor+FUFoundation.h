//
//  UIColor+FUFoundation.h
//  YtoCustomService
//
//  Created by fujunzhi on 2017/6/14.
//  Copyright © 2017年 fujunzhi. All rights reserved.
//

#import <UIKit/UIKit.h>

//颜色创建
#undef  RGBCOLOR
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

#undef  RGBACOLOR
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define UIColorFromHex(V)  [UIColor colorWithHexString:V]

@interface UIColor (FUFoundation)

+ (UIColor *)colorWithRGBHex:(UInt32)hex;
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;
+ (UIColor *)randomColor;

@end
