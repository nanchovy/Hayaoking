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

}
