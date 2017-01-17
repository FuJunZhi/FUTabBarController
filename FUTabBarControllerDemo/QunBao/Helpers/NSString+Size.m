//
//  NSString+Size.m
//  QunBao
//
//  Created by fujunzhi on 16/1/5.
//  Copyright © 2016年 QunBao. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)
- (CGSize)limitSize:(CGSize)size font:(UIFont *)font
{
    NSDictionary *attributesDic = @{
                                    NSFontAttributeName : font
                                    };
    return [self boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributesDic context:nil].size;
}

- (CGSize)limitSize:(CGSize)size attributes:(NSDictionary *)attributes
{
    return [self boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
}
@end
