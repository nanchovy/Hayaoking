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
        
        //　申し込みをしているかの確認
        let recruitCheckUrl: String = "http://52.196.173.16/recruits/check/5.json"
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
//                debugPrint("Success")

            } else {
                // まだRecruitを作っていないので，DateViewController，NavigationControllerへのボタンを作成する
                let button1 = UIButton()
                button1.frame = CGRect(x:60, y:300, width: 230, height:70)
                button1.backgroundColor = UIColor.blue
                button1.setTitle("日付を選択して申し込む", for: .normal)
                button1.addTarget(self, action: #selector(OpponentWaitingViewController.toDVC(sender: )), for: .touchUpInside)
                self.view.addSubview(button1)
                
                let button2 = UIButton()
                button2.frame = CGRect(x:60, y:450, width: 230, height:70)
                button2.backgroundColor = UIColor.blue
                button2.setTitle("対戦申し込みを見る", for: .normal)
                button2.addTarget(self, action: #selector(OpponentWaitingViewController.toOLVC(sender: )), for: .touchUpInside)
                
                self.view.addSubview(button2)
            }
        }
        
        
        
        
        
        

    }
    
    func toRCVC(sender: UIButton) {
        // 画面遷移，RecruitCancelViewControllerへ
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "RCVC") as! RecruitCancelViewController
        nextView.owner = owner
        self.present(nextView, animated: true, completion: nil)
    }

    func toDVC(sender: UIButton) {
        // 画面遷移，DateViewControllerへ
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "DVC") as! DateViewController
        nextView.owner = owner
        self.present(nextView, animated: true, completion: nil)
    }
    
    func toOLVC(sender: UIButton) {
        // 画面遷移，OpponentListViewControllerへ
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "OLVC") as! OpponentListViewController
        nextView.owner = owner
        self.present(nextView, animated: true, completion: nil)
    }



}
