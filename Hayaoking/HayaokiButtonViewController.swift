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
import Foundation

class HayaokiButtonViewController: UIViewController {
    
    var owner: User?
    var matching: Matching?

    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint(matching)
        debugPrint("This is HBVC")
        
        let hayaokiTime = "GETUP!\nat\(matching!.matchingDate.hour):\(matching!.matchingDate.min)"
        let showStatusLabel = UILabel()
        showStatusLabel.text = hayaokiTime
        showStatusLabel.numberOfLines = 0
        showStatusLabel.sizeToFit()
        showStatusLabel.center =  CGPoint(x:150, y:150)
        self.view.addSubview(showStatusLabel)
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    @IBAction func HayaokiButton(_ sender: Any) {
        Alamofire.request("http://52.196.173.16/battles/wake.json", method: .post, parameters:[
            "id": matching!.id,
            "winner_id": owner!.userId
            ]).responseJSON{ response in
                let responseJson = JSON(response.result.value!)
                debugPrint(responseJson)
                let result = responseJson["result"].intValue  // authorizerなら-1, applicantなら1
                let ownerPos = self.appOrAuth(user: self.owner!, matching: self.matching!)
                var resultAlert = UIAlertController()
                
                if result == ownerPos {
                    // ownerの勝利
                    debugPrint("かち")
                    self.alertInputter(alert: resultAlert, title: "勝った！勝った！", message: "おめでとう！")
                } else if abs(result) == abs(ownerPos) {
                    // ownerの負け
                    debugPrint("負け")
                    self.alertInputter(alert: resultAlert, title: "負け", message: "次は頑張ろう")
                } else {
                    // 引き分け
                    debugPrint("引き分け")
                    self.alertInputter(alert: resultAlert, title: "引き分け", message: "二人とも起きなかった")
                }
                
                let okAction = UIAlertAction(title: "OK", style: .default, handler: {
                    (action:UIAlertAction!) -> Void in
//                    let nextView = storyboard?.instantiateViewController(withIdentifier: "FBRVC") as! FindBattleRequestViewController
//                    self.present(nextView, animated: true, completion: nil)
                
                    self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
                })
                resultAlert.addAction(okAction)
                self.present(resultAlert, animated: true, completion: nil)
                
                
        }
        
    }
    
    func appOrAuth(user: User, matching: Matching) -> Int {
        if user.name == matching.authorizer {
            return -1
        } else {
            return 1
        }
    }
    func alertInputter(alert: UIAlertController, title: String, message: String) {
        alert.title = title
        alert.message = message
    }
}
