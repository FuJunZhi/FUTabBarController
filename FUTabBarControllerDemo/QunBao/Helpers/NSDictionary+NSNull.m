//
//  NSDictionary+NSNull.m
//  VISSApp
//
//  Created by fujunzhi on 15/9/11.
//  Copyright (c) 2015年 QunBao. All rights reserved.
//

#import "NSDictionary+NSNull.h"

@implementation NSDictionary (NSNull)

- (id) notNullObjectForKey:(id)key
{
    id obj = self[key];
    if ([obj isKindOfClass:[NSNull class]] || !obj)
    {
        return nil;
    }
    else if ([obj isKindOfClass:[NSString class]])
    {
        NSString *objStr = [obj uppercaseString];
        NSRange range = [objStr rangeOfString:@"NULL"];
        if (range.location != NSNotFound && objStr.length-range.length <= 2)
            return nil;
    }
    return obj;
}

@end
