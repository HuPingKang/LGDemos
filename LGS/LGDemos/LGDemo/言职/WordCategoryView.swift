//
//  WordCategoryView.swift
//  LGDemo
//  Created by qwer on 2018/4/11.
//  Copyright © 2018年 qwer. All rights reserved.

import UIKit

class WordCategoryView: UIView {

    @IBOutlet weak var jxBtn: UIButton!
    @IBOutlet weak var htBtn: UIButton!
    @IBOutlet weak var gzBtn: UIButton!
    @IBOutlet weak var zlBtn: UIButton!
    @IBOutlet weak var colorView: UIView!
    
    var selectIndexResponse:((_ index:Int)->())?
    
    var cateIndex:Int = 0{
    
        didSet{

            let array = [jxBtn,htBtn,gzBtn,zlBtn]
            var center = self.colorView.center
            center.x = (array[cateIndex]?.center.x)!

            UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: [], animations: {
                self.colorView.center = center
            }) { (finished) in
                
                UIView.animate(withDuration: 0.2, animations: {
                    array[self.cateIndex]?.setTitleColor(UIColor.black, for: .normal)
                    array.forEach({ (btn) in
                        if btn != array[self.cateIndex]{
                            btn?.setTitleColor(UIColor.lightGray, for: .normal)
                        }
                    })
                }, completion: nil)
                
            }

        }
        
    }
    
    static func getView()->WordCategoryView{
        
        let xx = Bundle.main.loadNibNamed("WordCategoryView", owner: nil, options: nil)?.last as! WordCategoryView
        
        xx.frame = CGRect.init(x: 0, y: 0, width: KW, height: 45)
        xx.initUi()
        
        return xx
        
    }
    
    private func initUi(){
        self.colorView.frame = CGRect.init(x: 0, y: 43, width: 20, height: 2)
        var center = self.colorView.center
        center.x = self.jxBtn.center.x
        self.colorView.center = center
        self.jxBtn.setTitleColor(UIColor.black, for: .normal)
        
        let frame = CGRect.init(x: 0, y: 5, width: self.bounds.size.width, height: self.bounds.size.height-5)
        self.layer.shadowOpacity = 0.25
        self.layer.shadowOffset = CGSize.init(width: 0, height: 1)
        self.layer.shadowPath = UIBezierPath(rect: frame).cgPath
        self.layer.shadowColor = UIColor(red: 118/255.0, green: 124/255.0, blue: 131/255.0, alpha: 1).cgColor
        
    }
    @IBAction func one(_ sender: Any) {
        
        if self.selectIndexResponse != nil {
            self.selectIndexResponse!(0)
        }
        
    }
    
    @IBAction func two(_ sender: Any) {
        if self.selectIndexResponse != nil {
            self.selectIndexResponse!(1)
        }
    }
    
    @IBAction func three(_ sender: Any) {
        if self.selectIndexResponse != nil {
            self.selectIndexResponse!(2)
        }
    }
    
    @IBAction func four(_ sender: Any) {
        if self.selectIndexResponse != nil {
            self.selectIndexResponse!(3)
        }
    }
    
    
}
