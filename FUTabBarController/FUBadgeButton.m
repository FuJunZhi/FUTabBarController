//
//  FUBadgeButton.m
//  QunBao
//
//  Created by fujunzhi on 16/1/5.
//  Copyright © 2016年 FJZ. All rights reserved.
//

#import "FUBadgeButton.h"
#import "NSString+size.h"
#import "UIImage+Extension.h"


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
    } else if (badgeValue.intValue == 0)
    {
        badgeValue = @"";
    }
    
    if (badgeValue && badgeValue.length) {
        self.hidden = NO;
        
        // 设置文字
        [self setTitle:badgeValue forState:UIControlStateNormal];
        
        // 设置frame
        CGRect frame = self.frame;
        CGFloat badgeH = self.currentBackgroundImage.size.height;
        CGFloat badgeW = self.currentBackgroundImage.size.width;
        if (badgeValue.length > 1) {
            // 文字的尺寸
            CGSize badgeSize = [badgeValue getStringSizeWithfont:self.titleLabel.font bound:CGSizeMake(CGFLOAT_MAX, badgeH) lineBreakMode:NSLineBreakByCharWrapping];
            badgeW = badgeSize.width + 10;
        }
        frame.size.width = badgeW;
        frame.size.height = badgeH;
        self.frame = frame;
    } else {
        self.hidden = YES;
    }
}

@end
