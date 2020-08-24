//
//  FUMutableCopyModel.m
//  YtoCustomService
//
//  Created by fujunzhi on 2019/10/21.
//  Copyright © 2019 YTO. All rights reserved.
//

#import "FUMutableCopyModel.h"

@implementation FUMutableCopyModel
- (id)mutableCopyWithZone:(NSZone *)zone {
    FUMutableCopyModel *copyModel = [[[self class] allocWithZone:zone] init];
    unsigned int count;
    Ivar *varList = class_copyIvarList([self class], &count);
    for (int i = 0 ; i < count; i ++) {
        Ivar var = varList[i];
        const char *name = ivar_getName(var);
        NSString *utf8Name = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
        if ([[utf8Name substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"_"]) {
            utf8Name = [utf8Name substringFromIndex:1];
        }
        id value = [self valueForKey:utf8Name];
        [copyModel setValue:value forKey:utf8Name];
    }
    free(varList);
    return copyModel;
}


- (id)copyWithZone:(NSZone *)zone
{
   FUMutableCopyModel *copyModel = [[[self class] allocWithZone:zone] init];
    unsigned int count;
    Ivar *varList = class_copyIvarList([self class], &count);
    for (int i = 0 ; i < count; i ++) {
        Ivar var = varList[i];
        const char *name = ivar_getName(var);
        NSString *utf8Name = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
        if ([[utf8Name substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"_"]) {
            utf8Name = [utf8Name substringFromIndex:1];
        }
        id value = [self valueForKey:utf8Name];
        [copyModel setValue:value forKey:utf8Name];
    }
    
    free(varList);
    return copyModel;
}

MJCodingImplementation

@end
