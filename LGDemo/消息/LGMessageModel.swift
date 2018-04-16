//
//  LGMessageModel.swift
//  LGDemo
//
//  Created by qwer on 2018/4/13.
//  Copyright © 2018年 qwer. All rights reserved.
//

import UIKit

class LGMessageModel: NSObject {

    @objc var pictureUrl:String? = ""
    @objc var videoUrl:String? = ""
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
    //获取视频数据：
    static func getData()->[LGMessageModel]?{
        
        guard let path = Bundle.main.path(forResource: "video", ofType: "json") else{
            return nil;
        }
        guard let data = try? Data.init(contentsOf: URL.init(fileURLWithPath: path)) else{
            return nil;
        }
        guard let list:[[String:Any]] = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [[String:Any]] else{
            return nil;
        }
        
        var picModels:[LGMessageModel] = [LGMessageModel]()
        list.forEach { (dix) in
            
            let model = LGMessageModel()
            model.setValuesForKeys(dix)
            picModels.append(model)
            
        }
        
        return picModels;
        
    }
    
}
