//
//  HomeSectionView.swift
//  LGDemo
//
//  Created by qwer on 2018/4/10.
//  Copyright © 2018年 qwer. All rights reserved.
//

import UIKit

class HomeSectionView: UIView {

    //
    static func getHeader()->HomeSectionView{
        
        let xx = Bundle.main.loadNibNamed("HomeSectionView", owner: nil, options: nil)?.last as! HomeSectionView
        xx.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50)
        return xx
        
    }
    
}
