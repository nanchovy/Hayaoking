//
//  OpponentWaitingViewController.swift
//  Hayaoking
//
//  Created by 長安尚之 on 2017/04/26.
//  Copyright © 2017年 長安尚之. All rights reserved.
//
//  バトルリクエストを送った後に，承認が来るまで待機する画面。バトルリクエストのキャンセルもできる。


import UIKit
import SwiftyJSON
import Alamofire

class OpponentWaitingViewController: UIViewController {
    
    var owner: User?

    override func viewDidLoad() {
//        debugPrint(owner?.userId)
//        var userInfoText: String = "ユーザID: \(owner?.userId)"

        var userInfoText = "ユーザID:\(owner?.userId)\nユーザ名:\(owner?.name)\nwin:\(owner?.win)\nlose:\(owner?.lose)\ndraw:\(owner?.draw)\nwin:\(owner?.score)\n"
        var showStatusLabel = UILabel()
        showStatusLabel.text = userInfoText
        showStatusLabel.numberOfLines = 0
        showStatusLabel.sizeToFit()
        showStatusLabel.center =  CGPoint(x:150, y:150)
        self.view.addSubview(showStatusLabel)
        
        super.viewDidLoad()
        
        //ボタンを二つ作る。一つはバトルリクエストを出していない人用に，二付を選択できるボタン
        let recruitCheckUrl: String = "http://52.196.173.16/recruits/check/1.json"
        debugPrint(recruitCheckUrl)
        Alamofire.request(recruitCheckUrl).responseJSON{ response in
            debugPrint(type(of: response.result.value!))
            let didRecruit:Bool = response.result.value! as! Bool
            
            if didRecruit == true {
                // すでにRecruit実行済みなので，RecruitCancellViewへのボタンを作成する
                let button = UIButton()
                button.frame = CGRect(x:60, y:300, width: 230, height:100)
                button.backgroundColor = UIColor.blue
                button.setTitle("対戦申請を確認する", for: .normal)
                button.addTarget(self, action: #selector(OpponentWaitingViewController.toRCVC(sender: )), for: .touchUpInside)

                self.view.addSubview(button)
                
                
                debugPrint("Success")
//                let toCancelButton = UIButton()
//                toCancelButton.setTitle("申し込み時間の確認", for: .normal)
//                toCancelButton.setTitleColor(UIColor.blue, for: .normal)
//                toCancelButton.layer.masksToBounds = true
////                let posXofCB: CGFloat = self.view.frame.width/2
//                toCancelButton.layer.position = CGPoint(x: 150, y: 250)
//                self.view.addSubview(toCancelButton)
                
                
                
                
            } else {
                // まだRecruitを作っていないので，DateViewController，NavigationControllerへのボタンを作成する
            }
        }
        
        
        
        
        
        

    }
    
    func toRCVC(sender: UIButton) {
        // 画面遷移，RecruitCancelViewControllerへ
        var storyboard: UIStoryboard = self.storyboard!
        var nextView = storyboard.instantiateViewController(withIdentifier: "RCVC") as! RecruitCancelViewController
        self.present(nextView, animated: true, completion: nil)
        
    }
}




