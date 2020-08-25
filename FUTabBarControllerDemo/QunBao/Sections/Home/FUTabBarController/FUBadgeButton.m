//
//  FUBadgeButton.m
//  FUTabBarController
//
//  Created by fujunzhi on 16/1/5.
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

#import "FUBadgeButton.h"
#import "NSString+size.h"
#import "UIImage+fExtension.h"


@implementation FUBadgeButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.hidden = YES;
        self.userInteractionEnabled = NO;
        [self setBackgroundImage:[UIImage resizedImageWithName:@"tabbar_badge"] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:11];
    }
    return self;
}

//提示信息按钮赋值
- (void)setBadgeValue:(NSString *)badgeValue
{
    _badgeValue = [badgeValue copy];
    if (badgeValue.intValue > 99) {
        badgeValue = @"99+";
    } else if (badgeValue.intValue <= 0)
    {
        badgeValue = @"";
    }
    
    if (badgeValue && badgeValue.length) {
        self.hidden = NO;
        // 设置文字
        [self setTitle:badgeValue forState:UIControlStateNormal];
    } else {
        self.hidden = YES;
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    // 设置frame
    CGRect frame = self.frame;
    CGFloat badgeH = self.currentBackgroundImage.size.height;
    CGFloat badgeW = self.currentBackgroundImage.size.width;
    if (self.currentTitle.length > 1) {
        // 文字的尺寸
        CGSize badgeSize = [self getStringSizeWithfont:self.titleLabel.font bound:CGSizeMake(MAXFLOAT, badgeH) lineBreakMode:NSLineBreakByCharWrapping withString:self.currentTitle];
        badgeW = badgeSize.width + 10;
    }
    frame.size.width = badgeW;
    frame.size.height = badgeH;
    self.frame = frame;
}

//获取字符串的大小size
- (CGSize)getStringSizeWithfont:(UIFont*)font bound:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode withString:(NSString *)string{
    
    CGSize sizeResult = CGSizeZero;
    if ((id) self != [NSNull null] && self != nil){
        
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        sizeResult = [string sizeWithFont:font constrainedToSize:size lineBreakMode:lineBreakMode];
#pragma clang diagnostic pop
        
    }
    return  sizeResult;
}

@end
