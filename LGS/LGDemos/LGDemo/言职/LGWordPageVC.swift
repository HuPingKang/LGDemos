//
//  LGWordPageVC.swift
//  LGDemo
//
//  Created by qwer on 2018/4/12.
//  Copyright © 2018年 qwer. All rights reserved.
//

import UIKit

class LGWordPageVC: UITableViewController {
    
    private lazy var headerView: UIView = {
        
        let xx = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 170))
        xx.backgroundColor = UIColor.init(red: 236/255.0, green: 236/255.0, blue: 236/255.0, alpha: 1)
        
        let sd = SDCycleScrollView(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 160), imageNamesGroup: ["02.jpg","03.jpg","04.jpg","05.jpg"])
        sd?.titlesGroup = ["言职课堂 | 如何写一份让HR无法拒绝的简历","你知道自己的运营能力值多少钱吗？","在职场中，如何提升自己的价值？","如何判断一个公司是否靠谱？"]
        sd?.autoScrollTimeInterval = 2
        sd?.titleLabelBackgroundColor = (UIColor.black).withAlphaComponent(0.4)
        sd?.showPageControl = false
        sd?.scrollDirection = .horizontal
        sd?.titleLabelTextFont = UIFont.init(name: "PingFang-SC-Medium", size: 16)
        sd?.titleLabelTextColor = UIColor.white
        sd?.titleLabelTextAlignment = .left
        sd?.titleLabelHeight = 40
        
        xx.addSubview(sd!)
        
        return xx
        
    }()
    var pageIndex:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = .none
        
        if pageIndex == 0 {
            self.tableView.tableHeaderView = self.headerView
        }
        if pageIndex == 3 {
           self.tableView.register(UINib.init(nibName: "LGWordPagePicCell", bundle: nil), forCellReuseIdentifier: "LGWordPagePicCell")
        }
        self.tableView.register(UINib.init(nibName: "LGWordPageCell", bundle: nil), forCellReuseIdentifier: "LGWordPageCell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension LGWordPageVC{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if pageIndex == 3 {
            let cell = LGWordPagePicCell.getCell(tableView, indexPath)
            return cell
        }else{
            let cell = LGWordPageCell.getCell(tableView, indexPath)
            return cell
        }
        
        
    }
    
    
}
