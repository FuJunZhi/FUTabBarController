//
//  FUTabBarButton.m
//  QunBao
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

#import "FUTabBarButton.h"
#import "FUTabBarHeader.h"
#import "FUBadgeButton.h"
#import "UIButton+WebCache.h"

@interface FUTabBarButton()
/**
 *  提醒数字
 */
@property (nonatomic, weak) FUBadgeButton *badgeButton;
@end

@implementation FUTabBarButton


- (void)dealloc
{
    [self.item removeObserver:self forKeyPath:@"badgeValue"];
    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        // 图标居中
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        // 文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        // 字体大小
        self.titleLabel.font = [UIFont systemFontOfSize:FUFontSize];
        
        // 文字颜色
        [self setTitleColor:FUTabBarButtonTitleColor forState:UIControlStateNormal];
        [self setTitleColor:FUTabBarButtonSelectedTitleColor forState:UIControlStateSelected];
        // 添加提醒数字按钮
        FUBadgeButton *badgeButton = [[FUBadgeButton alloc] init];
        //距右、上距离不变
//        badgeButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
        [self addSubview:badgeButton];
        self.badgeButton = badgeButton;
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    self.titleLabel.font = [UIFont systemFontOfSize:selected ? FUSelectFontSize : FUFontSize];
}

//去掉高亮状态
- (void)setHighlighted:(BOOL)highlighted{}


- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * kTabBarButtonImageRatio;
    CGFloat imageY = 5;
    //中心按钮宽等于高
    if (self.item.isOffset) {
        imageH = contentRect.size.width;
        imageY = 0;
    }
    if (!self.item.isOffset && !self.item.title.length)
        return CGRectMake(0, imageY, imageW, contentRect.size.height - imageY * 2);
    else
        return CGRectMake(0, imageY, imageW, imageH);
}


- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    //中心按钮，标题的位置应与其他一样
    CGFloat titleY = (self.item.isOffset ? self.superview.frame.size.height : contentRect.size.height) * kTabBarButtonImageRatio + (contentRect.size.height - self.superview.frame.size.height) + 2;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}

- (void)setItem:(UITabBarItem *)item {
    
    _item = item;
    // KVO 监听属性改变
    [item addObserver:self forKeyPath:@"badgeValue" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:NSKeyValueObservingOptionNew context:nil];
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}


/**
 *  监听到某个对象的属性改变了,就会调用
 *
 *  @param keyPath 属性名
 *  @param object  哪个对象的属性被改变
 *  @param change  属性发生的改变
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (![self.currentTitle isEqualToString:self.item.title]) [[NSNotificationCenter defaultCenter] postNotificationName:@"FUTabBarController_ItemTitleChange" object:nil];
    // 设置文字
    [self setTitle:self.item.title forState:UIControlStateSelected];
    [self setTitle:self.item.title forState:UIControlStateNormal];
    
    // 设置图片
    if (stringIsNotEmpty(self.item.netImageName))
        [self sd_setImageWithURL:[NSURL URLWithString:self.item.netImageName] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"tool_nor"]];
    else
        [self setImage:self.item.image forState:UIControlStateNormal];
    if (stringIsNotEmpty(self.item.netSelectedImageName))
        [self sd_setImageWithURL:[NSURL URLWithString:self.item.netSelectedImageName] forState:UIControlStateSelected placeholderImage:[UIImage imageNamed:@"tool"]];
    else
        [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    // 设置提醒数字
    self.badgeButton.badgeValue = self.item.badgeValue;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    // 设置提醒数字的位置
    CGFloat badgeY = 2;
    CGFloat badgeX = self.bounds.size.width / 2;
    CGRect badgeF = self.badgeButton.frame;
    badgeF.origin.x = badgeX;
    badgeF.origin.y = badgeY;
    self.badgeButton.frame = badgeF;
}
@end

