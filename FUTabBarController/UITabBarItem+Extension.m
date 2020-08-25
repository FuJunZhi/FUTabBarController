//
//  UITabBarItem+Extension.m
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

#import "UITabBarItem+Extension.h"
#import <objc/runtime.h>
const NSString *UITabBarItem_Extension_Key = @"UITabBarItem+Extension";

BOOL stringIsNotEmpty (NSString * str)
{
    if (str == nil || str == NULL)
    {
        return YES;
    }
    if ([str isKindOfClass:[NSNull class]])
    {
        return YES;
    }
    if ([[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0)
    {
        return YES;
    }
    return NO;
}

BOOL stringIsEmpty (NSString * str)
{
    return ! stringIsNotEmpty(str);
}

NSString* replaceNullValue (id str)
{
    return stringIsEmpty(str) ? @"" : [NSString stringWithFormat:@"%@",str];
}

@implementation UITabBarItem (Extension)
- (void)setOffset:(BOOL)offset
{
    objc_setAssociatedObject(self, @selector(isOffset), @(offset), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isOffset
{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setNetImageName:(NSString *)netImageName
{
    if(self && netImageName) objc_setAssociatedObject(self, @selector(netImageName), netImageName , OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSString *)netImageName
{
   return self ? replaceNullValue(objc_getAssociatedObject(self, _cmd)) :  @"";
}

- (void)setNetSelectedImageName:(NSString *)netSelectedImageName
{
    if(self && netSelectedImageName) objc_setAssociatedObject(self, @selector(netSelectedImageName), netSelectedImageName , OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSString *)netSelectedImageName
{
   return self ? replaceNullValue(objc_getAssociatedObject(self, _cmd)) :  @"";
}
@end
