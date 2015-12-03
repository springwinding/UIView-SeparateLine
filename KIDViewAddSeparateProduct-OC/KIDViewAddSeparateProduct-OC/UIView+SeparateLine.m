//
//  UIView+SeparateLine.m
//  mybaby
//
//  Created by JiangYan on 15/11/26.
//  Copyright © 2015年 Baidu. All rights reserved.
//

#import "UIView+SeparateLine.h"
#import "NSObject+Property.h"

static char  kViewSeparateTypeTop          ;
static char  kViewSeparateTypeLeft         ;
static char  kViewSeparateTypeBottom       ;
static char  kViewSeparateTypeRight        ;

@implementation UIView(SeparateLine)
@dynamic topSeparateLineColor;
@dynamic topSeparateLineHeight;
@dynamic topSeparateLineEdegeInset;
@dynamic leftSeparateLineColor;
@dynamic leftSeparateLineHeight;
@dynamic leftSeparateLineEdegeInset;
@dynamic bottomSeparateLineColor;
@dynamic bottomSeparateLineHeight;
@dynamic bottomSeparateLineEdegeInset;
@dynamic rightSeparateLineColor;
@dynamic rightSeparateLineHeight;
@dynamic rightSeparateLineEdegeInset;
@dynamic showSeparateLineType;
@dynamic hiddenSeparateLineType;

- (void)setShowSeparateLineType:(KIDViewSeparateType)viewSeparateType{
    if (viewSeparateType & KIDViewSeparateTypeTop) {
        [self p_showTopSeparateLine];
    }
    if (viewSeparateType & KIDViewSeparateTypeLeft) {
        [self p_showLeftSeparateLine];
    }
    if (viewSeparateType & KIDViewSeparateTypeBottom) {
        [self p_showBottomSeparateLine];
    }
    if (viewSeparateType & KIDViewSeparateTypeRight) {
        [self p_showRightSeparateLine];
    }
}

- (void)setHiddenSeparateLineType:(KIDViewSeparateType)viewSeparateType {
    UIView *separateView = nil;
    if (viewSeparateType & KIDSeparateTypeAll) {
        separateView = objc_getAssociatedObject(self, &kViewSeparateTypeTop);
        separateView.hidden = YES;
        separateView = objc_getAssociatedObject(self, &kViewSeparateTypeLeft);
        separateView.hidden = YES;
        separateView = objc_getAssociatedObject(self, &kViewSeparateTypeBottom);
        separateView.hidden = YES;
        separateView = objc_getAssociatedObject(self, &kViewSeparateTypeRight);
        separateView.hidden = YES;
    }else{
        if (viewSeparateType & KIDViewSeparateTypeTop) {
            separateView = objc_getAssociatedObject(self, &kViewSeparateTypeTop);
            separateView.hidden = YES;
        }
        if (viewSeparateType & KIDViewSeparateTypeLeft) {
            separateView = objc_getAssociatedObject(self, &kViewSeparateTypeLeft);
            separateView.hidden = YES;
        }
        if (viewSeparateType & KIDViewSeparateTypeBottom) {
            separateView = objc_getAssociatedObject(self, &kViewSeparateTypeBottom);
            separateView.hidden = YES;
        }
        if (viewSeparateType & KIDViewSeparateTypeRight) {
            separateView = objc_getAssociatedObject(self, &kViewSeparateTypeRight);
            separateView.hidden = YES;
        }
    }
}

- (void)setTopSeparateLineEdegeInset:(UIEdgeInsets)topSeparateLineEdegeInset {
    UIView *separateView = objc_getAssociatedObject(self, &kViewSeparateTypeTop);
    if (separateView) {
        NSArray *sepratorConstraints = separateView.extraPropertys[@"constraints"];
        [sepratorConstraints enumerateObjectsUsingBlock:^(NSLayoutConstraint *obj, NSUInteger idx, BOOL *stop) {
            if (0 == idx) {
                obj.constant = topSeparateLineEdegeInset.left;
            }else if(1 == idx){
                obj.constant = topSeparateLineEdegeInset.right;
            }
        }];
    }
}

- (void)setLeftSeparateLineEdegeInset:(UIEdgeInsets)leftSeparateLineEdegeInset {
    UIView *separateView = objc_getAssociatedObject(self, &kViewSeparateTypeLeft);
    if (separateView) {
        NSArray *sepratorConstraints = separateView.extraPropertys[@"constraints"];
        [sepratorConstraints enumerateObjectsUsingBlock:^(NSLayoutConstraint *obj, NSUInteger idx, BOOL *stop) {
            if (0 == idx) {
                obj.constant = leftSeparateLineEdegeInset.top;
            }else if(1 == idx){
                obj.constant = leftSeparateLineEdegeInset.bottom;
            }
        }];
    }
}

- (void)setBottomSeparateLineEdegeInset:(UIEdgeInsets)bottomSeparateLineEdegeInset {
    UIView *SeparateView = objc_getAssociatedObject(self, &kViewSeparateTypeBottom);
    if (SeparateView) {
        NSArray *sepratorConstraints = SeparateView.extraPropertys[@"constraints"];
        [sepratorConstraints enumerateObjectsUsingBlock:^(NSLayoutConstraint *obj, NSUInteger idx, BOOL *stop) {
            if (0 == idx) {
                obj.constant = bottomSeparateLineEdegeInset.left;
            }else if(1 == idx){
                obj.constant = bottomSeparateLineEdegeInset.right;
            }
        }];
    }
}

- (void)setRightSeparateLineEdegeInset:(UIEdgeInsets)rightSeparateLineEdegeInset {
    UIView *separateView = objc_getAssociatedObject(self, &kViewSeparateTypeRight);
    if (separateView) {
        NSArray *sepratorConstraints = separateView.extraPropertys[@"constraints"];
        [sepratorConstraints enumerateObjectsUsingBlock:^(NSLayoutConstraint *obj, NSUInteger idx, BOOL *stop) {
            if (0 == idx) {
                obj.constant = rightSeparateLineEdegeInset.top;
            }else if(1 == idx){
                obj.constant = rightSeparateLineEdegeInset.bottom;
            }
        }];
    }
}

- (void)setTopSeparateLineColor:(UIColor *)topSeparateLineColor {
    UIView *separateView = objc_getAssociatedObject(self, &kViewSeparateTypeTop);
    if (separateView) {
        separateView.backgroundColor = topSeparateLineColor;
    }
}

- (void)setBottomSeparateLineColor:(UIColor *)bottomSeparateLineColor {
    UIView *separateView = objc_getAssociatedObject(self, &kViewSeparateTypeBottom);
    if (separateView) {
        separateView.backgroundColor = bottomSeparateLineColor;
    }
}

- (void)setLeftSeparateLineColor:(UIColor *)leftSeparateLineColor {
    UIView *separateView = objc_getAssociatedObject(self, &kViewSeparateTypeLeft);
    if (separateView) {
        separateView.backgroundColor = leftSeparateLineColor;
    }
}

- (void)setRightSeparateLineColor:(UIColor *)rightSeparateLineColor {
    UIView *separateView = objc_getAssociatedObject(self, &kViewSeparateTypeRight);
    if (separateView) {
        separateView.backgroundColor = rightSeparateLineColor;
    }
}

- (void)setTopSeparateLineHeight:(CGFloat)topSeparateLineHeight {
    UIView *separateView = objc_getAssociatedObject(self, &kViewSeparateTypeTop);
    [self p_updateSperateLineView:separateView withHeight:topSeparateLineHeight];
}

- (void)setLeftSeparateLineHeight:(CGFloat)leftSeparateLineHeight {
    UIView *separateView = objc_getAssociatedObject(self, &kViewSeparateTypeLeft);
    [self p_updateSperateLineView:separateView withHeight:leftSeparateLineHeight];
}

- (void)setBottomSeparateLineHeight:(CGFloat)bottomSeparateLineHeight {
    UIView *separateView = objc_getAssociatedObject(self, &kViewSeparateTypeBottom);
    [self p_updateSperateLineView:separateView withHeight:bottomSeparateLineHeight];
}

- (void)setRightSeparateLineHeight:(CGFloat)rightSeparateLineHeight {
    UIView *separateView = objc_getAssociatedObject(self, &kViewSeparateTypeRight);
    [self p_updateSperateLineView:separateView withHeight:rightSeparateLineHeight];
}


#pragma mark private method
- (void)p_showTopSeparateLine {
    UIView* sperateView = objc_getAssociatedObject(self, &kViewSeparateTypeTop);
    if (!sperateView) {
        sperateView = [[UIView alloc]init];
        sperateView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:sperateView];
        
        sperateView.backgroundColor = [UIColor colorWithRed:0xdf/255.0 green:0xd6/255.0 blue:0xce/255.0 alpha:1.0];
        NSArray * constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[sepratorView]-0-|" options:0 metrics:nil views:@{@"sepratorView":sperateView}];
        if (constraints) {
            sperateView.extraPropertys[@"constraints"] = constraints;
            [self addConstraints:constraints];
        }
        
        NSArray *heightConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[sepratorView(==0.5)]" options:0 metrics:nil views:@{@"sepratorView":sperateView}];
        if (heightConstraints) {
             sperateView.extraPropertys[@"heightConstraints"] = heightConstraints;
            [self addConstraints: heightConstraints];
        }
        
        objc_setAssociatedObject(self, &kViewSeparateTypeTop, sperateView, OBJC_ASSOCIATION_RETAIN);
    }
    
    sperateView.hidden = NO;
}

- (void)p_showLeftSeparateLine {
    UIView* sperateView = objc_getAssociatedObject(self, &kViewSeparateTypeLeft);
    if (!sperateView) {
        sperateView = [[UIView alloc]init];
        sperateView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:sperateView];
        sperateView.backgroundColor = [UIColor colorWithRed:0xdf/255.0 green:0xd6/255.0 blue:0xce/255.0 alpha:1.0];
        
        NSArray * constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[sepratorView(==0.5)]" options:0 metrics:nil views:@{@"sepratorView":sperateView}];
        if (constraints) {
            sperateView.extraPropertys[@"heightConstraints"] = constraints;
            [self addConstraints:constraints];
        }
        
        NSArray *heightConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[sepratorView]-0-|" options:0 metrics:nil views:@{@"sepratorView":sperateView}];
        if (heightConstraints) {
            sperateView.extraPropertys[@"constraints"] = heightConstraints;
            [self addConstraints: heightConstraints];
        }
        
        objc_setAssociatedObject(self, &kViewSeparateTypeLeft, sperateView, OBJC_ASSOCIATION_RETAIN);
    }
    
    sperateView.hidden = NO;
}

- (void)p_showBottomSeparateLine {
    UIView* sperateView = objc_getAssociatedObject(self, &kViewSeparateTypeBottom);
    if (!sperateView) {
        sperateView = [[UIView alloc]init];
        sperateView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:sperateView];
        sperateView.backgroundColor = [UIColor colorWithRed:0xdf/255.0 green:0xd6/255.0 blue:0xce/255.0 alpha:1.0];
        
        NSArray * constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[sepratorView]-0-|" options:0 metrics:nil views:@{@"sepratorView":sperateView}];
        if (constraints) {
            sperateView.extraPropertys[@"constraints"] = constraints;
            [self addConstraints:constraints];
        }
        
        NSArray *heightConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[sepratorView(==0.5)]-0-|" options:0 metrics:nil views:@{@"sepratorView":sperateView}];
        if (heightConstraints) {
            sperateView.extraPropertys[@"heightConstraints"] = heightConstraints;
            [self addConstraints: heightConstraints];
        }
        
        objc_setAssociatedObject(self, &kViewSeparateTypeBottom, sperateView, OBJC_ASSOCIATION_RETAIN);
    }
    
    sperateView.hidden = NO;
}

- (void)p_showRightSeparateLine {
    UIView* sperateView = objc_getAssociatedObject(self, &kViewSeparateTypeRight);
    if (!sperateView) {
        sperateView = [[UIView alloc]init];
        sperateView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:sperateView];
        sperateView.backgroundColor = [UIColor colorWithRed:0xdf/255.0 green:0xd6/255.0 blue:0xce/255.0 alpha:1.0];
        
        NSArray * constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[sepratorView]-0-|" options:0 metrics:nil views:@{@"sepratorView":sperateView}];
        if (constraints) {
            sperateView.extraPropertys[@"constraints"] = constraints;
            [self addConstraints:constraints];
        }
        
        NSArray *heightConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"[sepratorView(==0.5)]-0-|" options:0 metrics:nil views:@{@"sepratorView":sperateView}];
        if (heightConstraints) {
            sperateView.extraPropertys[@"heightConstraints"] = heightConstraints;
            [self addConstraints: heightConstraints];
        }
        
        objc_setAssociatedObject(self, &kViewSeparateTypeRight, sperateView, OBJC_ASSOCIATION_RETAIN);
    }
    
    sperateView.hidden = NO;
}

- (void)p_updateSperateLineView:(UIView *)SeparateLineView withHeight:(CGFloat)lineHeight {
    NSArray *heightContraints = SeparateLineView.extraPropertys[@"heightConstraints"];
    [heightContraints enumerateObjectsUsingBlock:^(NSLayoutConstraint*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (NSLayoutAttributeHeight == obj.firstAttribute || NSLayoutAttributeHeight == obj.secondAttribute) {
            obj.constant = lineHeight;
        }else if(NSLayoutAttributeWidth == obj.firstAttribute || NSLayoutAttributeWidth == obj.secondAttribute){
            obj.constant = lineHeight;
        }
    }];
}

@end
