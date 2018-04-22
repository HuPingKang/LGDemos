//
//  LGWordVC.swift
//  LGDemo
//
//  Created by qwer on 2018/4/10.
//  Copyright © 2018年 qwer. All rights reserved.
//
import SnapKit
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
    
    //提问：
    private lazy var questionControl:UIControl = {
       
        let xx = UIControl.init(frame: CGRect.init(x: self.view.frame.maxX-75, y: self.view.frame.maxY-75-kNaviHeight-kTabHeight, width: 60, height: 60))
        xx.layer.cornerRadius = 30
        xx.layer.masksToBounds = true
        xx.backgroundColor = UIColor.init(red: 73/255.0, green: 164/255.0, blue: 218/255.0, alpha: 1)
        
        let imageV = UIImageView()
        imageV.image = UIImage.init(named: "comment")
        xx.addSubview(imageV)
        imageV.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(10)
            make.centerX.equalTo(xx)
        }
       
        let label = UILabel.init()
        label.text = "提问"
        label.textColor = UIColor.white
        label.font = UIFont.init(name: "PingFang-SC-Regular", size: 11)
        label.textAlignment = .center
        xx.addSubview(label)
        label.snp.makeConstraints({ (maker) in
            maker.bottom.equalTo(-10)
            maker.centerX.equalTo(xx)
        })
        
        xx.addTarget(self, action: #selector(self.questions), for: .touchUpInside)
        
        return xx
    }()
    
    private var childVCs:[LGWordPageVC]?
    
    @objc private func questions(){
        print("send your questions...")
    }
    
    private lazy var cateView:WordCategoryView = {
       
        let xx = WordCategoryView.getView()
        weak var wSelf = self
        xx.selectIndexResponse = {
            
            index in
            
            wSelf?.pageController?.setViewControllers([self.childVCs![index]], direction: index > xx.cateIndex ?.forward:.reverse, animated: true, completion: { (fx) in
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
        self.childVCs = [LGWordPageVC]()
        for i in 0..<4 {
            let vc = LGWordPageVC()
            vc.pageIndex = i
            self.childVCs?.append(vc)
        }
        self.pageController?.setViewControllers([(self.childVCs?[0])!], direction: .reverse, animated: false, completion: nil)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: self.leftSearchBtn)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: self.rightUserInfoBtn)
        
        self.view.addSubview(cateView)
        self.navigationItem.titleView = titleView
        self.view.addSubview(self.questionControl)
        self.view.bringSubview(toFront: self.questionControl)
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
        
        let currentIndex:Int = (self.childVCs?.index(of: viewController as! LGWordPageVC))!
        self.cateView.cateIndex = currentIndex

        if currentIndex > 0 {
            return self.childVCs?[currentIndex-1]
            
        }else{
            return nil
        }
    
    }
  
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let currentIndex:Int = (self.childVCs?.index(of: viewController as! LGWordPageVC))!
        self.cateView.cateIndex = currentIndex

        if currentIndex < (self.childVCs?.count)! - 1 {
            return self.childVCs?[currentIndex+1]
            
        }else{
            return nil
        }
        
      
    }
    
}
