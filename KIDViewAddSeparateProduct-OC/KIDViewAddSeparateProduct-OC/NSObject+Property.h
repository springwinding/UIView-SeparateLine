//
//  NSObject+Property.h
//  mybaby
//
//  Created by Zhao Pengwei on 14-1-16.
//  Copyright (c) 2014年 Baidu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (Property)

@property(nonatomic, strong, readonly) NSMutableDictionary *extraPropertys;

@end