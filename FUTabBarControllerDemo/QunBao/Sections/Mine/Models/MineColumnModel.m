//
//  MineColumnModel.m
//  QunBao
//
//  Created by fujunzhi on 16/1/6.
//  Copyright © 2016年 QunBao. All rights reserved.
//

#import "MineColumnModel.h"
#import "NSDictionary+NSNull.h"

@implementation MineColumnModel
- (instancetype) initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        self.iconName = [dic notNullObjectForKey:@"icon"];
        self.title = [dic notNullObjectForKey:@"title"];
    }
    return self;
}
+ (instancetype) mineColumnModelWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}
@end
