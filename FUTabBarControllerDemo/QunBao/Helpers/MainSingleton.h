//
//  MainSingleton.h
//  QunBao
//
//  Created by fujunzhi on 16/1/5.
//  Copyright © 2016年 QunBao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MainSingleton : NSObject
+ (instancetype) defaultSingleton;

//字符串是否为空
BOOL stringIsNotEmpty (NSString * str);
BOOL stringIsEmpty (NSString * str);

//时间转换
- (NSString *) dateToString:(NSDate *)date;
- (NSDate *) stringToDate:(NSString *)dateStr;
- (NSString *) timeToString:(time_t)time;

//获取时间
- (NSString *) getTime;
- (NSString *) getDay;
- (NSString *) intervalFromLastDate: (NSString *) dateString1 toTheDate:(NSString *) dateString2;

//颜色转换
- (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
@end








