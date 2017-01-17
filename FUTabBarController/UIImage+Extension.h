//
//  UIImage+Extension.h
//  QunBao
//
//  Created by fujunzhi on 16/11/4.
//  Copyright © 2016年 QunBao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
/**
 *  返回一张自由拉伸的图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name;
@end
