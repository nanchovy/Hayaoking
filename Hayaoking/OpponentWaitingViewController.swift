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
        Alamofire.request("http://52.196.173.16/users.json", method: .post, parameters:req).responseJSON{ response in
            let userJson = JSON(response.result.value!)  // ユーザ名が被っていると，ここでエラーが出る。あとで対応。
            let userId = userJson["id"].intValue  // 悩んだところ。
            
            let owner = UserDefaults.standard
            owner.set(userJson["id"].intValue, forKey: "userId")
            owner.set(userJson["name"].stringValue, forKey: "userName")
            owner.synchronize()
            debugPrint(owner.string(forKey: "userId"))
            debugPrint(owner.string(forKey: "userName"))
            
            
            
            //            let owner1 = User(user_id: userJson["id"].intValue, name: userJson["name"].stringValue)  // 初回ユーザ登録完了
            //            userDefaults.set(true, forKey: "signUp")
            //            debugPrint(userDefaults)  // 初回ユーザ登録が終わったので，signUpをtrueにする
            // debugPrint(owner)
            
            
            
            
            //　成功した時のダイアログ表示
//            let signUpCompleteAlert = UIAlertController(title: "成功", message: "登録完了しました", preferredStyle: .alert)
//            let signUpComplete = UIAlertAction(title: "OK", style: .default, handler: {
//                (action:UIAlertAction!) -> Void in
//                
//                // 画面遷移
//                var storyboard: UIStoryboard = self.storyboard!
//                var nextView = storyboard.instantiateViewController(withIdentifier: "OWVC") as! OpponentWaitingViewController
//                var owner = User(user_id: userJson["id"].intValue, name: userJson["name"].stringValue)
//                debugPrint("hoge")
//                debugPrint(owner.name)
//                nextView.owner = owner
//                self.present(nextView, animated: true, completion: nil)
//            })
//            signUpCompleteAlert.addAction(signUpComplete)
//            self.present(signUpCompleteAlert, animated: true, completion: nil)
        }
        
        
        
        
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    



}
