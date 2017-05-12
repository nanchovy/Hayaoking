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
    
    var owner: User?
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
        var id =  recruitId["id"] as! Int
        debugPrint(self.recruitId)
        debugPrint(id)
        
        let noticeAlert = UIAlertController(title: "確認", message: "対戦を申し込みますか？", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {
                (action:UIAlertAction!) -> Void in
            // okボタンを押した時の処理。
            debugPrint("self.owner.name")
            debugPrint(self.owner!.name)
            Alamofire.request("http://52.196.173.16/recruits/accept.json", method: .post, parameters:[
                "id":id,
                "authorizer": self.owner!.name
                ]).responseJSON{ response in
                    let responseJson = JSON(response.result.value!)
                    debugPrint(responseJson)
                    
                    var applicant = responseJson["applicant"].stringValue
                    var authorizer = responseJson["authorizer"].stringValue
                    
                    let matchingDateString = responseJson["getup"].stringValue
                    let recruitYear: Int = self.stringCutter(str: matchingDateString, start:0, end:4)  // この辺のstart, endはstrをintに変換するために必要なもの。
                    let recruitMonth: Int = self.stringCutter(str: matchingDateString, start:5, end:7)
                    let recruitDay: Int = self.stringCutter(str: matchingDateString, start:8, end:10)
                    let recruitHour: Int = self.stringCutter(str: matchingDateString, start:11, end:13)
                    let recruitMin: Int = self.stringCutter(str: matchingDateString, start:14, end:16)
                    var matchingDate = MatchingDate(year: recruitYear, month: recruitMonth, day: recruitDay, hour: recruitHour, min: recruitMin)
                    
                    let matching = Matching(applicant: applicant, authorizer: authorizer, matchingDate: matchingDate)
                    
                    
                    let storyboard: UIStoryboard = self.storyboard!
                    let nextView = storyboard.instantiateViewController(withIdentifier: "HBVC") as! HayaokiButtonViewController
                    nextView.matching = matching
                    nextView.owner = self.owner
                    self.present(nextView, animated: true, completion: nil)
                    
                   
                    
            }
        })
        let cancellAction = UIAlertAction(title: "Cancell", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            // cancellボタンを押した時の処理。
            self.dismiss(animated: true, completion: nil)
            })
        
        
        noticeAlert.addAction(okAction)
        noticeAlert.addAction(cancellAction)
        
        self.present(noticeAlert, animated: true, completion: nil)
    }
    
    func stringCutter(str: String, start: Int, end: Int) -> Int {
        let new = Int(str.substring(with: str.index(str.startIndex, offsetBy: start)..<str.index(str.startIndex, offsetBy: end)))
        return new!
    }
}
    

