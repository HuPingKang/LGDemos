//
//  LGWordPagePicCell.swift
//  LGDemo
//
//  Created by qwer on 2018/4/12.
//  Copyright © 2018年 qwer. All rights reserved.
//

import UIKit

class LGWordPagePicCell: UITableViewCell {
    
    static func getCell(_ tableView:UITableView,_ index:IndexPath)->LGWordPagePicCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LGWordPagePicCell", for: index) as! LGWordPagePicCell
        return cell
        
    }
    @IBOutlet weak var picImageV: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        picImageV.layer.cornerRadius = 5
        picImageV.layer.masksToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
