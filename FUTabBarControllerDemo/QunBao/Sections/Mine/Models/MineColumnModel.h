//
//  MineColumnModel.h
//  QunBao
//
//  Created by fujunzhi on 16/1/6.
//  Copyright © 2016年 QunBao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MineColumnModel : NSObject
/**
 *  图标
 */
@property (copy, nonatomic) NSString *iconName;
/**
 *  标题
 */
@property (copy, nonatomic) NSString *title;

- (instancetype) initWithDic:(NSDictionary *)dic;
+ (instancetype) mineColumnModelWithDic:(NSDictionary *)dic;
@end
