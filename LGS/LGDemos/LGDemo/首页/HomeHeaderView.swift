//
//  HomeHeaderView.swift
//  LGDemo
//
//  Created by qwer on 2018/4/10.
//  Copyright © 2018年 qwer. All rights reserved.
//

import UIKit

class HomeHeaderView: UIView {

    private lazy var headerSd:SDCycleScrollView = {
        
        let sd = SDCycleScrollView(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 220), imageNamesGroup: ["01.jpg","02.jpg","03.jpg","04.jpg","05.jpg"])
        
        sd?.autoScrollTimeInterval = 2
        sd?.pageControlStyle = SDCycleScrollViewPageContolStyleClassic
        sd?.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter
        sd?.titleLabelBackgroundColor = UIColor.clear
        sd?.scrollDirection = .horizontal
        sd?.pageControlDotSize = CGSize.init(width: 6, height: 6)
        
        return sd!
        
    }()
    
    private lazy var centerSd:SDCycleScrollView = {
        
        let sd = SDCycleScrollView.init(frame: CGRect.init(x: 66, y: 0, width:UIScreen.main.bounds.width-66 , height: 50),imageNamesGroup: ["",""])
        sd?.autoScrollTimeInterval = 2
        sd?.scrollDirection = .vertical
        sd?.titlesGroup = ["不求打赏，只求喜欢，关注和批评。对于我写的不对不好，你的评论与回复都是宝贵的意见，谢谢。","数量多2000万内容多维度满足作图需求"]
        sd?.showPageControl = false
        sd?.onlyDisplayText = true
        sd?.backgroundColor = UIColor.white
        sd?.titleLabelTextColor = UIColor.black
        sd?.titleLabelHeight = 50
        
        return sd!
        
    }()
    
    @IBOutlet weak var sdCycleView: UIView!
    
    @IBOutlet weak var sdCenterCycleView: UIView!
    
    @IBAction func speedFeedBack(_ sender: Any) {
    }
    @IBAction func hotPosition(_ sender: Any) {
    }
    @IBAction func highSalaries(_ sender: Any) {
    }
    
    //
    static func getHeader()->HomeHeaderView{
        
        let xx = Bundle.main.loadNibNamed("HomeHeaderView", owner: nil, options: nil)?.last as! HomeHeaderView
        xx.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 530)
        
        xx.sdCycleView.addSubview(xx.headerSd)
        xx.sdCenterCycleView.addSubview(xx.centerSd)
        return xx
        
    }
    
}
