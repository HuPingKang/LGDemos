//
//  HomePageCell.swift
//  LGDemo
//
//  Created by qwer on 2018/4/10.
//  Copyright © 2018年 qwer. All rights reserved.
//

import UIKit

class HomePageCell: UITableViewCell {

    @IBOutlet weak var companyLabel: UILabel!
    
    static func getCell(_ tableView:UITableView,_ indexPath:IndexPath)->HomePageCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomePageCell", for: indexPath) as! HomePageCell
        
        return cell
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.companyLabel.text = "Alibaba \n不需要融资 | 10000人 | 移动互联网"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
