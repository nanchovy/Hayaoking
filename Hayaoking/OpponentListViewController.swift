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

class OpponentListViewController: UIViewController, UITableViewDataSource {
    var names: [[String: String?]] = []
    let table = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "対戦可能なユーザ"
        table.frame = view.frame
        view.addSubview(table)
        table.dataSource = self
        getOpponentName()
    }


    
    func getOpponentName(){
        Alamofire.request("http://52.196.173.16/recruits.json").responseJSON { response in
            guard let object = response.result.value else {
                return
            }
            let json = JSON(object)
            json.forEach { (_, json) in
                let name: [String: String?] = [
                    "applicant": json["applicant"].string,
                    "getup": json["getup"].string
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
        cell.textLabel?.text = name["applicant"]! // 対戦相手の名前をtextLabelにセット
        cell.detailTextLabel?.text = name["getup"]! // 起きる時間をdetailTextLabelにセット
        return cell
    }
    
}
