//
//  ViewController.m
//  KIDViewAddSeparateProduct-OC
//
//  Created by JiangYan on 15/12/3.
//  Copyright © 2015年 Mybabay. All rights reserved.
//

#import "ViewController.h"
#import "UIView+SeparateLine.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:view];
    view.backgroundColor = [UIColor grayColor];
    
    view.showSeparateLineType = KIDSeparateTypeAll;
    view.topSeparateLineColor = [UIColor redColor];
    view.leftSeparateLineColor = [UIColor greenColor];
    view.bottomSeparateLineColor = [UIColor blueColor];
    view.rightSeparateLineColor = [UIColor purpleColor];
    
    view.topSeparateLineHeight = 2;
    view.leftSeparateLineHeight = 4;
    view.bottomSeparateLineHeight = 6;
    view.rightSeparateLineHeight = 8;
    
    view.topSeparateLineEdegeInset = UIEdgeInsetsMake(0,30,0 , 30);
    view.leftSeparateLineEdegeInset = UIEdgeInsetsMake(30, 0, 30, 0);
    view.bottomSeparateLineEdegeInset = UIEdgeInsetsMake(0, 30, 0, 30);
    view.rightSeparateLineEdegeInset = UIEdgeInsetsMake(30, 0, 30, 0);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
