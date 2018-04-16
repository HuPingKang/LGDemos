//
//  LGMessageVC.swift
//  LGDemo
//
//  Created by qwer on 2018/4/10.
//  Copyright © 2018年 qwer. All rights reserved.
//

import UIKit

class LGMessageVC: UITableViewController {

    private var playCell:LGVideoCell? = nil
    private var playerView:CLPlayerView? = nil
    
    private lazy var infoModels:[LGMessageModel]? = {
        let xx = LGMessageModel.getData()
        return xx
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.navigationItem.title = "看看"
        if #available(iOS 11.0, *) {
            self.tableView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false;
        };
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension LGMessageVC{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (infoModels?.count)!
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = LGVideoCell.getCell(tableView, indexPath)
        cell.infoModel = infoModels![indexPath.row]
        
        weak var wSelf = self
        cell.clickPlayResponse = {
            
            wSelf?.playCell = cell
            wSelf?.playerView?.destroyPlayer()
            let playerV = CLPlayerView.init(frame: CGRect.init(x: 0, y: 0, width: cell.width, height: 220))
            wSelf?.playerView = playerV
            cell.contentView.addSubview((wSelf?.playerView)!)
            wSelf?.playerView?.progressBackgroundColor = UIColor.init(red: 53/255.0, green: 53/255.0, blue: 65/255.0, alpha: 1)
            wSelf?.playerView?.progressBufferColor = UIColor.gray
            wSelf?.playerView?.progressPlayFinishColor = UIColor.white
            wSelf?.playerView?.url = URL.init(string: cell.infoModel.videoUrl!)
            wSelf?.playerView?.playVideo()
            wSelf?.playerView?.destroyPlay({
                
            })
            wSelf?.playerView?.backButton({ (btn) in
                
            })
            wSelf?.playerView?.endPlay({
                wSelf?.playerView?.destroyPlayer()
                wSelf?.playerView = nil;
                wSelf?.playCell = nil
            })
            
        }
        
        return cell
        
    }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell:LGVideoCell = cell as! LGVideoCell
        cell.infoModel = infoModels![indexPath.row]
        
    }
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if self.playCell == cell {
            self.playerView?.destroyPlayer()
            self.playCell = nil
        }
        
    }
}
