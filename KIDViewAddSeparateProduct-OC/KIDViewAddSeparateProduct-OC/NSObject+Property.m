//
//  NSObject+Property.m
//  mybaby
//
//  Created by Zhao Pengwei on 14-1-16.
//  Copyright (c) 2014年 Baidu. All rights reserved.
//

#import "NSObject+Property.h"
#import <objc/runtime.h>

@implementation NSObject (Property)

- (NSMutableDictionary *)extraPropertys {
   NSMutableDictionary * propertys = objc_getAssociatedObject(self, _cmd);
    if (!propertys) {
        propertys = [@{} mutableCopy];
        objc_setAssociatedObject(self, _cmd, propertys, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return propertys;
}

@end