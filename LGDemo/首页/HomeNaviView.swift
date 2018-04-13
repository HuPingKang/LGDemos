//
//  HomeNaviView.swift
//  LGDemo
//
//  Created by qwer on 2018/4/11.
//  Copyright © 2018年 qwer. All rights reserved.
//

import UIKit

class HomeNaviView: UIView {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var scanBtn: UIButton!
    
    var clickScan:(()->())?
    
    static func getNaviView()->HomeNaviView{
        
        let xx = Bundle.main.loadNibNamed("HomeNaviView", owner: nil, options: nil)?.last as! HomeNaviView
        
        return xx
        
    }
    
    @IBAction func scan(_ sender: Any) {
        
        if self.clickScan != nil {
            self.clickScan!()
        }
        
    }
    
    
    
}
