//
//  LGVideoCell.swift
//  LGDemo
//
//  Created by qwer on 2018/4/16.
//  Copyright © 2018年 qwer. All rights reserved.
//

import UIKit

class LGVideoCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var playView: PlayBottomToolBar!
    //播放点击事件：
    var clickPlayResponse:(()->())?
    
    var infoModel:LGMessageModel = LGMessageModel() {
        
        didSet{
            
            if let url = URL.init(string: infoModel.pictureUrl!)  {
                imgView.sd_setImage(with: url, completed: nil);
            }
            
        }
        
    }
    
    static func getCell(_ tableView:UITableView,_ indexPath:IndexPath)->LGVideoCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LGVideoCell", for: indexPath) as! LGVideoCell
        
        return cell
        
    }
    
    //播放点击事件：
    @objc private func playAction(){
        if self.clickPlayResponse != nil {
            self.clickPlayResponse!()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.playView.playButton.addTarget(self, action: #selector(self.playAction), for: .touchUpInside)
        
        // Configure the view for the selected state
    }

}
