//
//  FindBattleRequestViewController.swift
//  Hayaoking
//
//  Created by 長安尚之 on 2017/03/29.
//  Copyright © 2017年 長安尚之. All rights reserved.
//


//ここでは，試合の申し込みが受理されたか，もしくは自分に試合が申し込まれているかを調べる。

// 対戦記録テーブルの中で,「対戦を申し込まれた人のuserIDが自分」かつ，試合の成立がfalseであるものが存在すれば，それを表示する。試合を受けるなら，試合の成立をtrueにする。試合を受けないなら，行ごとテーブルを削除する。

// 対戦記録テーブルの中で，「対戦を申し込んだ人のuserIDが自分」かつ，試合の成立がtrueであるものが存在すれば，目覚ましボタンの画面に遷移し，アラート(予定)で試合受理を伝える。

import UIKit
import Foundation
import SwiftyJSON

class FindBattleRequestViewController: UIViewController {
    



    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBOutlet weak var titleText: UILabel!  // タイトルテキスト
    let userdefaults = UserDefaults.standard
    
    @IBAction func pushStartButton(_ sender: Any) {
        // 初回のボタンクリックでは，ユーザ名を入力させるダイアログを表示する。
        // 二回目以降では，バトルのリクエストがあるかを確認する。
        if UserDefaults.standard.bool(forKey: "signUp") == false {
            titleText.text = "HOGE"
            // 初回，ユーザ名を入力させ，登録する処理
            let signUpAlert = UIAlertController(title: "初回登録", message: "ユーザ名を入力してください", preferredStyle: .alert)
            
            titleText.text = "HOGE2"
            
//            // OKボタンの設定
//            let okAction = UIAlertAction(title: "OK", style: .default, handler: {
//                (action:UIAlertAction!) -> Void in
//                
//                self.titleText.text = "HOGEHOGE"
//                
//            })
//            signUpAlert.addAction(okAction)
            
            // テキストフィールドを追加
            signUpAlert.addTextField(configurationHandler: {(textField: UITextField!) -> Void in
                textField.placeholder = "ユーザ名"
            })
            
            // アラートを画面に表示
            self.present(signUpAlert, animated: true, completion: nil)
        }else{
            // 二回目以降，バトルリクエストの有無をしらべる処理
        }

    }
    
    
    
}
