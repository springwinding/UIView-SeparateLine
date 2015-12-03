//
//  UIView+SeparateLine.swift
//  KIDViewAddSeparateProduct
//
//  Created by JiangYan on 15/12/2.
//  Copyright © 2015年 Mybabay. All rights reserved.
//

import Foundation
import UIKit

public struct KIDViewSeparateType:OptionSetType {
    
    public init(rawValue: UInt) { self.rawValue = rawValue }
    public private(set) var rawValue: UInt
    public static var KIDViewSeparateTypeTop:KIDViewSeparateType {return self.init(rawValue:1<<0)}
    public static var KIDViewSeparateTypeLeft:KIDViewSeparateType {return self.init(rawValue: 1<<1)}
    public static var KIDViewSeparateTypeBottom:KIDViewSeparateType {return self.init(rawValue: 1<<2)}
    public static var KIDViewSeparateTypeRight:KIDViewSeparateType {return self.init(rawValue: 1<<3)}
    public static var KIDViewSeparateTypeAll:KIDViewSeparateType {return self.init(rawValue: 1 + 2 + 4 + 8)}
}

private var  kViewSeparateTypeTop     = ""
private var  kViewSeparateTypeLeft    = ""
private var  kViewSeparateTypeBottom  = ""
private var  kViewSeparateTypeRight   = ""
private var  kExtraPropotys           = ""

public extension UIView {
    
    public var showSeparateLineType: [KIDViewSeparateType]? {
        get{
            return nil
        }
        set {
            if (newValue != nil ) {
                if newValue!.contains(KIDViewSeparateType.KIDViewSeparateTypeAll) {
                    self.showTopSeparateLine()
                    self.showLeftSeparateLine()
                    self.showBottomSeparateLine()
                    self.showRightSeparateLine()
                }else{
                    if newValue!.contains(KIDViewSeparateType.KIDViewSeparateTypeTop) {
                        self.showTopSeparateLine()
                    }
                    if newValue!.contains(KIDViewSeparateType.KIDViewSeparateTypeLeft) {
                        self.showLeftSeparateLine()
                    }
                    if newValue!.contains(KIDViewSeparateType.KIDViewSeparateTypeBottom) {
                        self.showBottomSeparateLine()
                    }
                    if newValue!.contains(KIDViewSeparateType.KIDViewSeparateTypeRight) {
                        self.showRightSeparateLine()
                    }
                }
            }
        }
    }
    
    public var hiddenSeparateLineType: [KIDViewSeparateType]? {
        get {
            return nil
        }
        set {
            if (newValue != nil ) {
                var separateView:UIView?
                if newValue!.contains(KIDViewSeparateType.KIDViewSeparateTypeAll) {
                    separateView = objc_getAssociatedObject(self, &kViewSeparateTypeTop) as? UIView
                    separateView?.hidden = true
                    separateView = objc_getAssociatedObject(self, &kViewSeparateTypeLeft) as? UIView
                    separateView?.hidden = true
                    separateView = objc_getAssociatedObject(self, &kViewSeparateTypeBottom) as? UIView
                    separateView?.hidden = true
                    separateView = objc_getAssociatedObject(self, &kViewSeparateTypeRight) as? UIView
                    separateView?.hidden = true
                }else {
                    if newValue!.contains(KIDViewSeparateType.KIDViewSeparateTypeTop) {
                        separateView = objc_getAssociatedObject(self, &kViewSeparateTypeTop) as? UIView
                        separateView?.hidden = true
                    }
                    if newValue!.contains(KIDViewSeparateType.KIDViewSeparateTypeLeft) {
                        separateView = objc_getAssociatedObject(self, &kViewSeparateTypeLeft) as? UIView
                        separateView?.hidden = true
                    }
                    if newValue!.contains(KIDViewSeparateType.KIDViewSeparateTypeBottom) {
                        separateView = objc_getAssociatedObject(self, &kViewSeparateTypeBottom) as? UIView
                        separateView?.hidden = true
                    }
                    if newValue!.contains(KIDViewSeparateType.KIDViewSeparateTypeRight) {
                        separateView = objc_getAssociatedObject(self, &kViewSeparateTypeRight) as? UIView
                        separateView?.hidden = true
                    }
                }
                
            }
        }
    }
    
    
    public var topSeparateLineEdegeInset:UIEdgeInsets? {
        get {
            return nil
        }
        set {
            let separateView:UIView? = objc_getAssociatedObject(self, &kViewSeparateTypeTop) as? UIView
            if separateView != nil && newValue != nil {
                let sepratorConstraints = (separateView!.extraPropotys["constraints"]) as? [NSLayoutConstraint]
                if sepratorConstraints != nil {
                    for layoutConstraint in sepratorConstraints! {
                        if layoutConstraint.firstAttribute == NSLayoutAttribute.Left {
                            layoutConstraint.constant = newValue!.left
                        }else if layoutConstraint.firstAttribute == NSLayoutAttribute.Right {
                            layoutConstraint.constant = newValue!.right
                        }else if layoutConstraint.firstAttribute == NSLayoutAttribute.Top {
                            print("Top")
                        }else if layoutConstraint.firstAttribute == NSLayoutAttribute.Bottom {
                            print("Bottom")
                        }else if layoutConstraint.firstAttribute == NSLayoutAttribute.Height {
                            print("Height")
                        }
                    }
                }
            }
        }
    }
    
    public var leftSeparateLineEdegeInset:UIEdgeInsets? {
        get {
            return nil
        }
        set {
            let separateView:UIView? = objc_getAssociatedObject(self, &kViewSeparateTypeLeft) as? UIView
            if separateView != nil && newValue != nil {
                let sepratorConstraints = (separateView!.extraPropotys["constraints"]) as? [NSLayoutConstraint]
                if sepratorConstraints != nil {
                    for layoutConstraint in sepratorConstraints! {
                        if layoutConstraint.firstAttribute == NSLayoutAttribute.Top && layoutConstraint.secondAttribute == NSLayoutAttribute.Top{
                            layoutConstraint.constant = newValue!.top
                        }else if layoutConstraint.firstAttribute == NSLayoutAttribute.Bottom && layoutConstraint.secondAttribute == NSLayoutAttribute.Bottom{
                            layoutConstraint.constant = newValue!.bottom
                        }
                    }
                }
            }
        }
    }
    
    public var bottomSeparateLineEdegeInset:UIEdgeInsets? {
        get {
            return nil
        }
        set {
            let separateView:UIView? = objc_getAssociatedObject(self, &kViewSeparateTypeBottom) as? UIView
            if separateView != nil && newValue != nil {
                let sepratorConstraints = (separateView!.extraPropotys["constraints"]) as? [NSLayoutConstraint]
                if sepratorConstraints != nil {
                    for layoutConstraint in sepratorConstraints! {
                        if layoutConstraint.firstAttribute == NSLayoutAttribute.Left {
                            layoutConstraint.constant = newValue!.left
                        }else if layoutConstraint.firstAttribute == NSLayoutAttribute.Right {
                            layoutConstraint.constant = newValue!.right
                        }
                    }
                }
            }
        }
    }

    
    public var rightSeparateLineEdegeInset:UIEdgeInsets? {
        get {
            return nil
        }
        set {
            let separateView:UIView? = objc_getAssociatedObject(self, &kViewSeparateTypeRight) as? UIView
            if separateView != nil && newValue != nil {
                let sepratorConstraints = (separateView!.extraPropotys["constraints"]) as? [NSLayoutConstraint]
                if sepratorConstraints != nil {
                    for layoutConstraint in sepratorConstraints! {
                        if layoutConstraint.firstAttribute == NSLayoutAttribute.Top {
                            layoutConstraint.constant = newValue!.top
                        }else if layoutConstraint.firstAttribute == NSLayoutAttribute.Bottom {
                            layoutConstraint.constant = newValue!.bottom
                        }
                    }
                }
            }
        }
    }
    
    public var topSeparateLineHeight: Float?{
        get {
            return nil
        }
        set {
            let separateView:UIView? = objc_getAssociatedObject(self, &kViewSeparateTypeTop) as? UIView
            if separateView != nil && newValue != nil {
                self.updateSeprateLineView(separateView!, height: newValue!)
            }
        }
    }
    
    public var leftSeparateLineHeight: Float?{
        get {
            return nil
        }
        set {
            let separateView:UIView? = objc_getAssociatedObject(self, &kViewSeparateTypeLeft) as? UIView
            if separateView != nil && newValue != nil {
                self.updateSeprateLineView(separateView!, height: newValue!)
            }
        }
    }
    
    public var bottomSeparateLineHeight: Float?{
        get {
            return nil
        }
        set {
            let separateView:UIView? = objc_getAssociatedObject(self, &kViewSeparateTypeBottom) as? UIView
            if separateView != nil && newValue != nil {
                self.updateSeprateLineView(separateView!, height: newValue!)
            }
        }
    }
    
    public var rightSeparateLineHeight: Float?{
        get {
            return nil
        }
        set {
            let separateView:UIView? = objc_getAssociatedObject(self, &kViewSeparateTypeRight) as? UIView
            if separateView != nil && newValue != nil {
                self.updateSeprateLineView(separateView!, height: newValue!)
            }
        }
    }
    
    public var topSeparateLineColor: UIColor? {
        get {
            return nil
        }
        set {
            if newValue != nil {
                let separateView = objc_getAssociatedObject(self, &kViewSeparateTypeTop) as? UIView
                separateView?.backgroundColor = newValue
            }
        }
    }
    
    public var leftSeparateLineColor: UIColor? {
        get {
            return nil
        }
        set {
            if newValue != nil {
                let separateView = objc_getAssociatedObject(self, &kViewSeparateTypeLeft) as? UIView
                separateView?.backgroundColor = newValue
            }
        }
    }
    
    public var bottomSeparateLineColor: UIColor? {
        get {
            return nil
        }
        set {
            if newValue != nil {
                let separateView = objc_getAssociatedObject(self, &kViewSeparateTypeBottom) as? UIView
                separateView?.backgroundColor = newValue
            }
        }
    }
    
    public var rightSeparateLineColor: UIColor? {
        get {
            return nil
        }
        set {
            if newValue != nil {
                let separateView = objc_getAssociatedObject(self, &kViewSeparateTypeRight) as? UIView
                separateView?.backgroundColor = newValue
            }
        }
    }
    
    
    private var extraPropotys:NSMutableDictionary {
        get{
            var propotys:NSMutableDictionary? = objc_getAssociatedObject(self, &kExtraPropotys) as? NSMutableDictionary
            
            if propotys == nil {
                propotys = NSMutableDictionary()
                objc_setAssociatedObject(self, &kExtraPropotys, propotys!, .OBJC_ASSOCIATION_RETAIN)
            }
            return propotys!
        }
        set {
            let propotys = objc_getAssociatedObject(self, &kExtraPropotys) as! NSMutableDictionary
        
            for key in newValue.keyEnumerator() {
              let keyString = key as! String
                propotys.setObject(newValue[keyString]!, forKey: keyString)
            }
        }
    }
    
    
    private func showTopSeparateLine() -> Void {
        var sperateView: UIView? = objc_getAssociatedObject(self, &kViewSeparateTypeTop) as? UIView
        if sperateView == nil {
            sperateView = UIView()
            sperateView!.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(sperateView!)
            sperateView!.backgroundColor = UIColor(red: 0xdf/255.0, green: 0xd6/255.0, blue: 0xce/255.0, alpha: 1.0)
           let layouts =  NSLayoutConstraint.constraintsWithVisualFormat("|-0-[sepratorView]-0-|", options: NSLayoutFormatOptions.DirectionLeftToRight, metrics: nil, views: ["sepratorView":sperateView!])
            self.addConstraints(layouts)
            sperateView!.extraPropotys["constraints"] = layouts
            
            let heightConstraints =  NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[sepratorView(==0.5)]", options: NSLayoutFormatOptions.AlignAllBaseline, metrics: nil, views: ["sepratorView":sperateView!])
            self.addConstraints(heightConstraints)
            sperateView!.extraPropotys["heightConstraints"] = heightConstraints
            objc_setAssociatedObject(self, &kViewSeparateTypeTop, sperateView, .OBJC_ASSOCIATION_RETAIN)
        }
        sperateView?.hidden = false
    }
    
    private func showLeftSeparateLine() -> Void {
        var sperateView: UIView? = objc_getAssociatedObject(self, &kViewSeparateTypeLeft) as? UIView
        if sperateView == nil {
            sperateView = UIView()
            sperateView?.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(sperateView!)
            sperateView?.backgroundColor = UIColor(red: 0xdf/255.0, green: 0xd6/255.0, blue: 0xce/255.0, alpha: 1.0)
            let layouts =  NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[sepratorView]-0-|", options: NSLayoutFormatOptions.AlignAllBaseline, metrics: nil, views: ["sepratorView":sperateView!])
            self.addConstraints(layouts)
            sperateView!.extraPropotys["constraints"] = layouts
            
            let heightConstraints =  NSLayoutConstraint.constraintsWithVisualFormat("|-0-[sepratorView(==0.5)]", options: NSLayoutFormatOptions.AlignAllBaseline, metrics: nil, views: ["sepratorView":sperateView!])
            self.addConstraints(heightConstraints)
            sperateView!.extraPropotys["heightConstraints"] = heightConstraints
            objc_setAssociatedObject(self, &kViewSeparateTypeLeft, sperateView, .OBJC_ASSOCIATION_RETAIN)
        }
        sperateView?.hidden = false
    }
    
    private func showBottomSeparateLine() -> Void {
        var sperateView: UIView? = objc_getAssociatedObject(self, &kViewSeparateTypeBottom) as? UIView
        if sperateView == nil {
            sperateView = UIView()
            sperateView!.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(sperateView!)
            sperateView!.backgroundColor = UIColor(red: 0xdf/255.0, green: 0xd6/255.0, blue: 0xce/255.0, alpha: 1.0)
            let layouts =  NSLayoutConstraint.constraintsWithVisualFormat("|-0-[sepratorView]-0-|", options: NSLayoutFormatOptions.DirectionLeftToRight, metrics: nil, views: ["sepratorView":sperateView!])
            self.addConstraints(layouts)
            sperateView!.extraPropotys["constraints"] = layouts
            
            let heightConstraints =  NSLayoutConstraint.constraintsWithVisualFormat("V:[sepratorView(==0.5)]-0-|", options: NSLayoutFormatOptions.AlignAllBaseline, metrics: nil, views: ["sepratorView":sperateView!])
            self.addConstraints(heightConstraints)
            sperateView!.extraPropotys["heightConstraints"] = heightConstraints
            objc_setAssociatedObject(self, &kViewSeparateTypeBottom, sperateView, .OBJC_ASSOCIATION_RETAIN)
        }
        sperateView?.hidden = false
    }
    
    private func showRightSeparateLine() -> Void {
        var sperateView: UIView? = objc_getAssociatedObject(self, &kViewSeparateTypeRight) as? UIView
        if sperateView == nil {
            sperateView = UIView()
            sperateView?.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(sperateView!)
            sperateView?.backgroundColor = UIColor(red: 0xdf/255.0, green: 0xd6/255.0, blue: 0xce/255.0, alpha: 1.0)
            let layouts =  NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[sepratorView]-0-|", options: NSLayoutFormatOptions.AlignAllBaseline, metrics: nil, views: ["sepratorView":sperateView!])
            self.addConstraints(layouts)
            sperateView!.extraPropotys["constraints"] = layouts
            
            let heightConstraints =  NSLayoutConstraint.constraintsWithVisualFormat("[sepratorView(==0.5)]-0-|", options: NSLayoutFormatOptions.AlignAllBaseline, metrics: nil, views: ["sepratorView":sperateView!])
            self.addConstraints(heightConstraints)
            sperateView!.extraPropotys["heightConstraints"] = heightConstraints
            objc_setAssociatedObject(self, &kViewSeparateTypeRight, sperateView, .OBJC_ASSOCIATION_RETAIN)
        }
        sperateView?.hidden = false
    }
    
    private func updateSeprateLineView(seprateView:UIView, height:Float) {
        let heightConstraints = seprateView.extraPropotys["heightConstraints"] as? [NSLayoutConstraint]
        if heightConstraints != nil {
            for layoutConstraint in heightConstraints! {
                if layoutConstraint.firstAttribute == NSLayoutAttribute.Height || layoutConstraint.secondAttribute == NSLayoutAttribute.Height {
                    layoutConstraint.constant = CGFloat(height)
                } else if layoutConstraint.firstAttribute == NSLayoutAttribute.Width || layoutConstraint.secondAttribute == NSLayoutAttribute.Width {
                    layoutConstraint.constant = CGFloat(height)
                }
            }
        }
    }
}