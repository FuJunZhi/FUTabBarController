//
//  UIView+Frame.h
//  CNTaiPingAgent
//
//  Created by fujunzhi on 3/3/15.
//  Copyright (c) 2015 QunBao. All rights reserved.
//


#import <UIKit/UIKit.h>

CGPoint CGRectGetCenter(CGRect rect);
CGRect  CGRectMoveToCenter(CGRect rect, CGPoint center);

@interface UIView (ViewFrameGeometry)
@property CGPoint origin;
@property CGSize size;

@property (readonly) CGPoint bottomLeft;
@property (readonly) CGPoint bottomRight;
@property (readonly) CGPoint topRight;

@property CGFloat height;
@property CGFloat width;

@property CGFloat top;
@property CGFloat left;

@property CGFloat bottom;
@property CGFloat right;

@property (assign, nonatomic) CGFloat x;
@property (assign, nonatomic) CGFloat y;
@property (assign, nonatomic) CGFloat w;
@property (assign, nonatomic) CGFloat h;
@property (assign, nonatomic) CGFloat centralX;
@property (assign, nonatomic) CGFloat centralY;

- (void)moveBy:(CGPoint) delta;
- (void)scaleBy:(CGFloat) scaleFactor;
- (void)fitInSize:(CGSize) aSize;

- (void)addTopBorderWithHeight:(CGFloat)height color:(UIColor *)color;
- (void)addBottomBorderWithHeight:(CGFloat)height color:(UIColor *)color;
- (void)addLeftBorderWithWidth:(CGFloat)width color:(UIColor *)color;
- (void)addRightBorderWithWidth:(CGFloat)width color:(UIColor *)color;

@end