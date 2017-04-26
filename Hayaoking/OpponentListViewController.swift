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

class OpponentListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var names: [[String: Any?]] = []
    let table = UITableView()
    var recruitId: [String: Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "対戦可能なユーザ"
        table.frame = view.frame
        view.addSubview(table)
        table.dataSource = self
        table.delegate = self
        getOpponentName()
        
    }


    
    func getOpponentName(){
        Alamofire.request("http://52.196.173.16/recruits.json").responseJSON { response in
            guard let object = response.result.value else {
                return
            }
            let json = JSON(object)
            json.forEach { (_, json) in
                let name: [String: Any?] = [
                    "applicant": json["applicant"].string,
                    "getup": json["getup"].string,
                    "id": json["id"].int
                ]
                self.names.append(name)
            }
            self.table.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let name = names[indexPath.row]
        cell.textLabel?.text = name["applicant"]! as! String // 対戦相手の名前をtextLabelにセット
        cell.detailTextLabel?.text = name["getup"]! as! String // 起きる時間をdetailTextLabelにセット
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // セルが押された時の動作。jsonでPOSTし，画面遷移とダイアログ表示。
        self.recruitId = self.names[indexPath.row]
        debugPrint(recruitId["id"] as! Int)
        
    }
    
}
