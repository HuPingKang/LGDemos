//
//  LGHomeVC.swift
//  LGDemo
//
//  Created by qwer on 2018/4/10.
//  Copyright © 2018年 qwer. All rights reserved.
import UIKit

let KW:CGFloat = UIScreen.main.bounds.size.width
let KH:CGFloat = UIScreen.main.bounds.size.height
let kNaviHeight:CGFloat = (KW * KH == 812.0 * 375.0) ?84.0:64.0

class LGHomeVC: LGBaseVC {

    @IBOutlet weak var tableView: UITableView!
    
    private lazy var naviBgView:HomeNaviView = {
       
        let xx = HomeNaviView.getNaviView()
        xx.frame = CGRect.init(x: 0, y: 0, width: KW, height: (self.navigationController?.navigationBar.frame.size.height)!+20.0)
        xx.clickScan = {
            
            print("点击了扫描")
            
        }
        
        return xx
        
    }()
    
    private lazy var sectionView: HomeSectionView = {
        
        let xx = HomeSectionView.getHeader()
        return xx
        
    }()
    
    private lazy var headerView: HomeHeaderView = {
        
        let xx = HomeHeaderView.getHeader()
        return xx
        
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isTranslucent = false
        
    }
    
//    override var preferredStatusBarStyle: UIStatusBarStyle{
//        return .lightContent
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.view.insertSubview(self.naviBgView, belowSubview: (self.navigationController?.navigationBar)!)
        if #available(iOS 11.0, *) {
            self.tableView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false;
        };
        
        self.tableView.tableHeaderView = self.headerView
        self.tableView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            self.endRefresh()
        })
        
   
        self.tableView.mj_header.beginRefreshing()
        self.endRefresh()
        
    }

    private func endRefresh(){
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2) {
            self.tableView.mj_header.endRefreshing()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension LGHomeVC:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = HomePageCell.getCell(tableView, indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return sectionView
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y<0 {
            self.naviBgView.isHidden = true
            UIApplication.shared.statusBarStyle = .lightContent
        }else{
            self.naviBgView.isHidden = false
            UIApplication.shared.statusBarStyle = .default
        }
        var alpha = scrollView.contentOffset.y/220.0
        if alpha > 1 {
            alpha = 1
        }
        
        self.naviBgView.backgroundColor = (UIColor.white).withAlphaComponent(alpha)
        
    }
    
}
