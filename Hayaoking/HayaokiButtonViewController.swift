//
//  HayaokiButtonViewController.swift
//  Hayaoking
//
//  Created by 長安尚之 on 2017/05/12.
//  Copyright © 2017年 長安尚之. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HayaokiButtonViewController: UIViewController {
    
    var owner: User?
    var matching: Matching?

    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint(matching)
        debugPrint("This is HBVC")
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    @IBAction func HayaokiButton(_ sender: Any) {
        Alamofire.request("http://52.196.173.16/battles/wake.json", method: .post, parameters:[
            "id": 9,
            "winner_id": 12
            ]).responseJSON{ response in
                let responseJson = JSON(response.result.value!)
                debugPrint(responseJson)
                let result = responseJson["result"].intValue
                let ownerPos = self.appOrAuth(user: self.owner!, matching: self.matching!)
                if result == ownerPos {
                    // ownerの勝利
                    
                } else if abs(result) == abs(ownerPos) {
                    // ownerの負け
                } else {
                    // 引き分け
                }
                
                
                
                
                
        }
        
    }
    func appOrAuth(user: User, matching: Matching) -> Int {
        if user.name == matching.authorizer {
            return -1
        } else {
            return 1
        }
    }
}
