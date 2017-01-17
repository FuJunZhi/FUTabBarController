//
//  NSString+size.h
//  QunBao
//
//  Created by fujunzhi on 16/11/4.
//  Copyright © 2016年 QunBao. All rights reserved.
//

#import <Foundation/Foundation.h>
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

@interface NSString (size)
//获取字符串的大小size
- (CGSize)getStringSizeWithfont:(UIFont*)font bound:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode;
@end
