//
//  UIView.swift
//  zyhw
//
//  Created by Gaowei on 16/7/5.
//  Copyright © 2016年 Jacky. All rights reserved.
//

import UIKit
extension UIView{
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return self.layer.shadowRadius
        }
        set {
            self.layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return self.layer.shadowOpacity
        }
        set {
            self.layer.shadowOpacity = newValue
        }
    }
    var x:CGFloat{
        set{
            var frame = self.frame;
            frame.origin.x = x;
            self.frame = frame;
        }
        get{
            return self.frame.origin.x;
        }
        
    }
    var y:CGFloat{
        set{
            var frame = self.frame;
            frame.origin.y = y;
            self.frame = frame;
        }
        get{
            return self.frame.origin.y;
        }
    }
    var width:CGFloat{
        set{
            var frame = self.frame;
            frame.size.width = width;
            self.frame = frame;
        }get{
            return self.frame.size.width;
        }
    }
    var height:CGFloat{
        set{
            var frame = self.frame;
            frame.size.height = height;
            self.frame = frame;
        }get{
            return self.frame.size.height;
        }
    }
    func CGRectMake(x:CGFloat,y:CGFloat,width:CGFloat,heigth:CGFloat) -> CGRect {
        
        let rect = CGRect(x: x, y: y, width: width, height: heigth)
        return rect
        
    }
    
}
