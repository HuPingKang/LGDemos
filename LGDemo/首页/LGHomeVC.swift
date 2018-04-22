//
//  LGHomeVC.swift
//  LGDemo
//
//  Created by qwer on 2018/4/10.
//  Copyright © 2018年 qwer. All rights reserved.
import UIKit

let KW:CGFloat = UIScreen.main.bounds.size.width
let KH:CGFloat = UIScreen.main.bounds.size.height
let kNaviHeight:CGFloat = (KW * KH == 812.0 * 375.0) ?88.0:64.0
let kTabHeight:CGFloat = (KW * KH == 812.0 * 375.0) ?83.0:49.0

class LGHomeVC: LGBaseVC {

    @IBOutlet weak var tableView: UITableView!
    private lazy var headerView:HeaderView? = {
        
        let xx = HeaderView.init(title: "首页", button: "catalog_22x21_")
        xx?.delegate = self
        return xx
    }()
    private var adsData:[AdsModel]? = nil
    private var newsData:[NewsModel]? = nil
    private var paidNewsData:[PaidNewsModel]? = nil

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isTranslucent = false
        
    }
    
//    override var preferredStatusBarStyle: UIStatusBarStyle{
//        return .lightContent
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        HomeAdapter.setupDataSuccess { (news, ads, paidNews) in
            self.newsData = news;
            self.adsData = ads;
            self.paidNewsData = paidNews;
            self.tableView.reloadData()
        }
        
    }

    private func endRefresh(){
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.5) {
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
        if let _ = self.newsData?.count {
          
            return self.newsData!.count + self.adsData!.count + self.paidNewsData!.count;
            
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return self.adsData![0].cellHeight
        }else if indexPath.row == 2{
            return self.paidNewsData![0].cellHeight
        }
        return self.newsData![0].cellHeight
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let cell:AdsCell = AdsCell(tableview: tableView, adsModel: self.adsData!.first)
            cell.delegate = self
            return cell

        }else if indexPath.row == 2{
            
            let cell:PaidNewsCell = PaidNewsCell.init(tableView: tableView, paidNewsModel: self.paidNewsData![0])
            cell.delegate = self
            return cell
        }else if indexPath.row == 1{
            
            let cell:NewsCell = NewsCell.init(tableView: tableView, newsModel: self.newsData![indexPath.row-1])

            cell.delegate = self
            return cell
        }

        let cell:NewsCell = NewsCell.init(tableView: tableView, newsModel: self.newsData![indexPath.row-2])
        cell.delegate = self
        return cell
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        self.headerView?.viewScrolledBy(y: Float(scrollView.contentOffset.y))
    }
}

extension LGHomeVC:HeaderViewDelegate{
    
}
extension LGHomeVC:AdsCellDelegate,NewsCellDelegate,PaidNewsCellDelegate{
    
}

