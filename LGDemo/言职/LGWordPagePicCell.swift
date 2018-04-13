//
//  LGWordPagePicCell.swift
//  LGDemo
//
//  Created by qwer on 2018/4/12.
//  Copyright © 2018年 qwer. All rights reserved.
//
import SDWebImage
import UIKit

class LGWordPagePicCell: UITableViewCell {
    
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var picImageV: UIImageView!
    
    static func getCell(_ tableView:UITableView,_ index:IndexPath)->LGWordPagePicCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LGWordPagePicCell", for: index) as! LGWordPagePicCell
        return cell
        
    }
    var infoModel:LGWordPagePicModel = LGWordPagePicModel() {
        
        didSet{
            
            self.descLabel.text = infoModel.desc
            self.subLabel.text = infoModel.name
            
            if let url = URL.init(string: infoModel.pic1!){
                self.picImageV.sd_setImage(with: url, completed: nil)
            }
            
        }
        
    }
    
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
