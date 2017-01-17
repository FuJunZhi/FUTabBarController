//
//  NSString+size.m
//  QunBao
//
//  Created by fujunzhi on 16/11/4.
//  Copyright © 2016年 QunBao. All rights reserved.
//

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
