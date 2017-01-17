//
//  FUTabBarButton.m
//  QunBao
//
//  Created by fujunzhi on 16/1/5.
//  Copyright © 2016年 FJZ. All rights reserved.
//

#import "FUTabBarButton.h"
#import "FUBadgeButton.h"
#import "FUTabBarHeader.h"





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
        self.titleLabel.font = [UIFont systemFontOfSize:kFontSize];
        // 文字颜色
        [self setTitleColor:kTabBarButtonTitleColor forState:UIControlStateNormal];
        [self setTitleColor:kTabBarButtonSelectedTitleColor forState:UIControlStateSelected];
        // 添加提醒数字按钮
        FUBadgeButton *badgeButton = [[FUBadgeButton alloc] init];
        //距右、上距离不变
//        badgeButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
        [self addSubview:badgeButton];
        self.badgeButton = badgeButton;
        
    }
    return self;
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
    // 设置文字
    [self setTitle:self.item.title forState:UIControlStateSelected];
    [self setTitle:self.item.title forState:UIControlStateNormal];
    
    // 设置图片
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    
    // 设置提醒数字
    self.badgeButton.badgeValue = self.item.badgeValue;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    // 设置提醒数字的位置
    CGFloat badgeY = 2;
    CGFloat badgeX = self.center.x;
    CGRect badgeF = self.badgeButton.frame;
    badgeF.origin.x = badgeX;
    badgeF.origin.y = badgeY;
    self.badgeButton.frame = badgeF;
}








@end

