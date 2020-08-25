//
//  MainSingleton.m
//  QunBao
//
//  Created by fujunzhi on 16/1/5.
//  Copyright © 2016年 QunBao. All rights reserved.
//

#import "MainSingleton.h"

@implementation MainSingleton
+ (instancetype) defaultSingleton
{
    static MainSingleton *mainSingleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mainSingleton = [[MainSingleton alloc] init];
    });
    return mainSingleton;
}

#pragma mark - 计算时间间隔
- (NSString *) intervalFromLastDate: (NSString *) dateString1 toTheDate:(NSString *) dateString2
{
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *d1=[date dateFromString:dateString1];
    
    NSDate *d2=[date dateFromString:dateString2];
    
    NSTimeInterval time=[d2 timeIntervalSinceDate:d1];
    
    int days=((int)time)/(60);
    NSString *dateContent=[[NSString alloc] initWithFormat:@"%i",days];
    return dateContent;
}

#pragma mark - 获取时间
- (NSString *) getTime
{
    NSDateFormatter *formater = [[ NSDateFormatter alloc] init];
    NSDate *curDate = [NSDate date];
    [formater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString * curTime = [formater stringFromDate:curDate];
    return curTime;
}

- (NSString *) getDay
{
    NSDateFormatter *formater = [[ NSDateFormatter alloc] init];
    NSDate *curDate = [NSDate date];
    [formater setDateFormat:@"yyyy-MM-dd"];
    NSString * curTime = [formater stringFromDate:curDate];
    return curTime;
}

#pragma mark - 时间转换
- (NSString *) dateToString:(NSDate *)date
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString = [dateFormat stringFromDate:date];
    
    return dateString;
}

- (NSDate *) stringToDate:(NSString *)dateStr
{
    // Convert string to date object
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateFormat dateFromString:dateStr];
    
    return date;
}

- (NSString *) timeToString:(time_t)time
{
    NSDate *today = [NSDate date];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    NSTimeInterval interval = [date timeIntervalSinceDate:today];
    
    NSString *string;
    struct tm *t = localtime(&time);
    if (interval <= 24*60*60)
        string = [NSString stringWithFormat:@"今天 %02d:%02d", t->tm_hour, t->tm_min];
    else if (interval <= 48*60*60)
        string = [NSString stringWithFormat:@"昨天 %02d:%02d", t->tm_hour, t->tm_min];
    else
        string = [NSString stringWithFormat:@"%04d-%02d-%02d", t->tm_year, t->tm_mon, t->tm_mday];
    
    return string;
}

#pragma mark - 颜色转换
- (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha
{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}


@end





