//
//  LGMessageVC.swift
//  LGDemo
//
//  Created by qwer on 2018/4/10.
//  Copyright © 2018年 qwer. All rights reserved.
//

import UIKit

class LGMessageVC: LGBaseVC {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        DispatchQueue.global().async {
//            SPKitExample.sharedInstance().callThisAfterISVAccountLoginSuccess(withYWLoginId: "123", passWord: "123", preloginedBlock: {
//                // 可以显示会话列表页面
//
//                DispatchQueue.main.async {
//                    guard let chatVC = SPKitExample.sharedInstance().exampleMakeConversationListController(selectItemBlock: { (conversation) in
//
//                        guard let friendsVC = SPKitExample.sharedInstance().exampleMakeConversationViewController(with: conversation) else{
//                            return;
//                        }
//
//                        // self.present(friendsVC, animated: true, completion: nil)
//                        self.navigationController?.pushViewController(friendsVC, animated: true)
//                        self.navigationController?.isNavigationBarHidden = false
//
//                    }) else{
//                        return;
//                    }
//
//                    self.addChildViewController(chatVC)
//                    self.view.addSubview(chatVC.view)
//
//                }
//
//            }, successBlock: {
//                print("登陆成功")
//            }) { (error) in
//                print(error ?? "登陆失败")
//            }
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
