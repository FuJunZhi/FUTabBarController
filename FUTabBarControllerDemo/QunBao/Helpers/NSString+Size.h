//
//  NSString+Size.h
//  QunBao
//
//  Created by fujunzhi on 16/1/5.
//  Copyright © 2016年 QunBao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (Size)
- (CGSize)limitSize:(CGSize)size font:(UIFont *)font;
- (CGSize)limitSize:(CGSize)size attributes:(NSDictionary *)attributes;
@end
