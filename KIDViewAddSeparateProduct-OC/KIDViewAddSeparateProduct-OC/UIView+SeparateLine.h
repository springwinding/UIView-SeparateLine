//
//  UIView+SeparateLine.h
//  mybaby
//
//  Created by JiangYan on 15/11/26.
//  Copyright © 2015年 Baidu. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


typedef NS_OPTIONS(NSInteger, KIDViewSeparateType) {
    KIDViewSeparateTypeTop       = 1<<0,
    KIDViewSeparateTypeLeft      = 1<<1,
    KIDViewSeparateTypeBottom    = 1<<2,
    KIDViewSeparateTypeRight     = 1<<3,
    KIDSeparateTypeAll           = KIDViewSeparateTypeTop|
                                  KIDViewSeparateTypeLeft|
                                  KIDViewSeparateTypeBottom|
                                  KIDViewSeparateTypeRight
};

@interface UIView (SeparateLine)
@property(nonatomic, assign)KIDViewSeparateType showSeparateLineType;
@property(nonatomic, assign)KIDViewSeparateType hiddenSeparateLineType;

@property(nonatomic, assign)UIEdgeInsets       topSeparateLineEdegeInset;
@property(nonatomic, assign)UIEdgeInsets       leftSeparateLineEdegeInset;
@property(nonatomic, assign)UIEdgeInsets       bottomSeparateLineEdegeInset;
@property(nonatomic, assign)UIEdgeInsets       rightSeparateLineEdegeInset;

@property(nonatomic, assign)UIColor            *topSeparateLineColor;
@property(nonatomic, assign)UIColor            *leftSeparateLineColor;
@property(nonatomic, assign)UIColor            *bottomSeparateLineColor;
@property(nonatomic, assign)UIColor            *rightSeparateLineColor;

@property(nonatomic, assign)CGFloat           topSeparateLineHeight;
@property(nonatomic, assign)CGFloat           bottomSeparateLineHeight;
@property(nonatomic, assign)CGFloat           leftSeparateLineHeight;
@property(nonatomic, assign)CGFloat           rightSeparateLineHeight;
@end
