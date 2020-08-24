//
//  NSString+size.m
//  QunBao
//
//  Created by fujunzhi on 16/11/4.
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

#import "NSString+size.h"

@implementation NSString (size)
//获取字符串的大小size
- (CGSize)getStringSizeWithfont:(UIFont*)font bound:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode
{
    CGSize sizeResult = CGSizeZero;
    if ((id) self != [NSNull null] && self != nil)
    {
        if (iOS7)
        {
            if (self != nil && self.length > 0)
            {
                NSMutableAttributedString* attributedString = [[NSMutableAttributedString alloc] initWithString:self];
                [attributedString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, self.length)];
                
                //设置换行方式
                NSMutableParagraphStyle *paragraphStyle=[[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
                paragraphStyle.lineBreakMode=lineBreakMode;
                [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0,self.length)];
                
                sizeResult = [attributedString boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil].size;
            }
        }
        else
        {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
            sizeResult = [self sizeWithFont:font constrainedToSize:size lineBreakMode:lineBreakMode];
#pragma clang diagnostic pop
        }
    }
    return  sizeResult;
}

@end
