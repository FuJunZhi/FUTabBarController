//
//  UIImage+Extension.m
//  QunBao
//
//  Created by fujunzhi on 16/11/4.
//  Copyright © 2016年 QunBao. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
+ (UIImage *)resizedImageWithName:(NSString *)name
{
    UIImage *image = [self imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}
@end
