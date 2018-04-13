//
//  LGWordPageCell.swift
//  LGDemo
//
//  Created by qwer on 2018/4/12.
//  Copyright © 2018年 qwer. All rights reserved.
//

import UIKit

class LGWordPageCell: UITableViewCell {
    
    static func getCell(_ tableView:UITableView,_ index:IndexPath)->LGWordPageCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LGWordPageCell", for: index) as! LGWordPageCell
        return cell
        
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
