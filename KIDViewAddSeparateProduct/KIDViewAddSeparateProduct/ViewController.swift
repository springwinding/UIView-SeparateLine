//
//  ViewController.swift
//  KIDViewAddSeparateProduct
//
//  Created by JiangYan on 15/12/2.
//  Copyright © 2015年 Mybabay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let view = UIView(frame: CGRectMake(100, 100, 100, 100))
        view.backgroundColor = UIColor.grayColor()
        self.view.addSubview(view)
        view.showSeparateLineType = [.KIDViewSeparateTypeAll]
        view.topSeparateLineColor = UIColor.redColor()
        view.leftSeparateLineColor = UIColor.greenColor()
        view.bottomSeparateLineColor = UIColor.yellowColor()
        view.rightSeparateLineColor = UIColor.purpleColor()

        view.topSeparateLineHeight = Float(2)
        view.leftSeparateLineHeight = Float(4)
        view.bottomSeparateLineHeight = Float(8)
        view.rightSeparateLineHeight = Float(16)

        view.topSeparateLineEdegeInset = UIEdgeInsetsMake(0, 30, 0, 30)
        view.leftSeparateLineEdegeInset = UIEdgeInsetsMake(30, 0, 30, 0)
        view.bottomSeparateLineEdegeInset = UIEdgeInsetsMake(0, 30, 0, 30)
        view.rightSeparateLineEdegeInset = UIEdgeInsetsMake(30, 0, 30, 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

