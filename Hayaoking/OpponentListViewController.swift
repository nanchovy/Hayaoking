//
//  OpponentListViewController.swift
//  Hayaoking
//
//  Created by 長安尚之 on 2017/04/14.
//  Copyright © 2017年 長安尚之. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class OpponentListViewController: UIViewController {
    let table = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "対戦可能なユーザ"
        table.frame = view.frame
        view.addSubview(table)
        
        getOpponentName()
    }

    func getOpponentName(){
        Alamofire.request(battlesUrl).responseJSON { response in
            guard let object = response.result.value else {
                return
            }
            let json = JSON(object)
            json.forEach { (_, json) in
                print(response.result.value)
                //print(json[applicant].string)  // 対戦を申し込んだ人の名前を取得
            }
        }
    }
    
}
