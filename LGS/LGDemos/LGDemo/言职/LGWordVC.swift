//
//  LGWordVC.swift
//  LGDemo
//
//  Created by qwer on 2018/4/10.
//  Copyright © 2018年 qwer. All rights reserved.
//

import UIKit

class LGWordVC: LGBaseVC {
   
    private lazy var pageController:UIPageViewController? = {
        
        let xx = UIPageViewController.init(transitionStyle: UIPageViewControllerTransitionStyle.scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.horizontal, options: [:])
        xx.view.frame = self.view.bounds
        
        xx.delegate = self
        xx.dataSource = self
        
        xx.view.frame = CGRect.init(x: 0, y: 45, width: KW, height: self.view.bounds.size.height-45)
        self.addChildViewController(xx)
        self.view.addSubview(xx.view)
        
        return xx
    }()
    
    private lazy var cateView:WordCategoryView = {
       
        let xx = WordCategoryView.getView()
        weak var wSelf = self
        xx.selectIndexResponse = {
            
            index in
            
            let vc = LGWordPageVC()
            vc.pageIndex = index
            wSelf?.pageController?.setViewControllers([vc], direction: index > xx.cateIndex ?.forward:.reverse, animated: true, completion: { (fx) in
                
            })
            
            xx.cateIndex = index
            
        }
        return xx
        
    }()
    
    private lazy var titleView:UILabel = {
       
        let xx = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 44))
        xx.textColor = UIColor.black
        xx.font = UIFont.init(name: "PingFang-SC-Medium", size: 18)
        let attr = NSMutableAttributedString.init(string: "言职")
        let range = ("言职" as NSString).range(of: "职")
        attr.addAttribute(.foregroundColor, value: UIColor.blue, range: range)
        xx.attributedText = attr
        xx.textAlignment = .center
        return xx
        
    }()
    
    private lazy var leftSearchBtn:UIButton = {
        let btn = UIButton.init(type: UIButtonType.custom)
        btn.frame = CGRect.init(x: 0, y: 0, width: 44, height: 44)
        btn.setImage(UIImage.init(named: "icon_search"), for: .normal)
        btn.addTarget(self, action: #selector(self.search), for: .touchUpInside)
        return btn
        
    }()
    
    @objc func search(){
        print("search...")
    }
    
    private lazy var rightUserInfoBtn:UIButton = {
        
        let btn = UIButton.init(type: UIButtonType.custom)
        btn.frame = CGRect.init(x: 0, y: 0, width: 44, height: 44)
        btn.setImage(UIImage.init(named: "icon_user"), for: .normal)
        btn.addTarget(self, action: #selector(self.userInfo), for: .touchUpInside)
        return btn
        
    }()
    
    @objc func userInfo(){
        print("userInfo...")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pageController?.setViewControllers([LGWordPageVC()], direction: .reverse, animated: false, completion: nil)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: self.leftSearchBtn)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: self.rightUserInfoBtn)
        
        self.view.addSubview(cateView)
        self.navigationItem.titleView = titleView
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension LGWordVC:UIPageViewControllerDelegate,UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! LGWordPageVC).pageIndex
        index -= 1
        
        print("before:\(index)")
        if index < 0 {
            return nil
        }
        
        let vc = LGWordPageVC()
        vc.pageIndex = index
        self.cateView.cateIndex = index
        
        return vc
        
    }
  
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
     
        var index = (viewController as! LGWordPageVC).pageIndex
        index += 1
        
        print("after:\(index)")
        if index > 3 {
            return nil
        }
        
        let vc = LGWordPageVC()
        vc.pageIndex = index
        self.cateView.cateIndex = index
        
        return vc
        
    }
    
}
