//
//  LGWordPagePicModel.swift
//  LGDemo
//
//  Created by qwer on 2018/4/13.
//  Copyright © 2018年 qwer. All rights reserved.
//

import UIKit

//种草小分队
class LGWordPagePicModel: NSObject {

    /**
    "list": [{
    "id": "2",
    "name": "\u6df1\u591c\u00b7\u987b\u81fe\u00b7\u56fe\u4e66\u9986",
    "pic1": "http:\/\/7xiwnz.com2.z0.glb.qiniucdn.com\/post_group1\/201601\/53971024.jpg?v=1452828469",
    "pic2": "http:\/\/7xiwnz.com2.z0.glb.qiniucdn.com\/post_group2\/201601\/53971024.jpg?v=1452828469",
    "pic3": "http:\/\/7xiwnz.com2.z0.glb.qiniucdn.com\/post_group3\/201512\/48999710.jpg?v=1450437392",
    "create_time": "1455701158",
    "update_time": "1455701158",
    "author": {},
    "attention_users": [],
    "dynamic": {
    "views": 121262,
    "attentions": 5659,
    "posts": 257
    },
    "attention_type": 0,
    "desc": "\u8bfb\u4e66\u5c31\u662f\u751f\u6d3b,\u50cf\u547c\u5438\u4e00\u6837\u4e0d\u80fd\u6ca1\u6709\u7684\u751f\u6d3b,\u662f\u4e00\u79cd\u987b\u81fe\u4e0d\u53ef\u6216\u7f3a\u7684\u5b58\u5728\u65b9\u5f0f\u3002"
    },
    */
    
    @objc var name:String? = ""
    @objc var pic1:String? = ""
    @objc var desc:String? = ""
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
    
    static func getData()->[LGWordPagePicModel]?{
        
        guard let path = Bundle.main.path(forResource: "种草小分队", ofType: "") else{
            return nil;
        }
        guard let data = try? Data.init(contentsOf: URL.init(fileURLWithPath: path)) else{
            return nil;
        }
        guard let dataDix:[String:Any] = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:Any] else{
            return nil;
        }
        guard let result:[String:Any] = (dataDix["data"] as? [String:Any]) else {
            return nil;
        }
        guard let list:[[String:Any]] = (result["list"] as? [[String:Any]]) else {
            return nil;
        }
        
        var picModels:[LGWordPagePicModel] = [LGWordPagePicModel]()
        list.forEach { (dix) in
            
            let model = LGWordPagePicModel()
            model.setValuesForKeys(dix)
            picModels.append(model)
            
        }
        
        return picModels;
        
    }
    
    
}
