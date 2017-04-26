//
//  DateViewController.swift
//  Hayaoking
//
//  Created by 長安尚之 on 2017/04/23.
//  Copyright © 2017年 長安尚之. All rights reserved.
//

import UIKit
import SwiftyJSON
import Foundation
import Alamofire
let testUser = "test3"


class DateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    

    
    @IBOutlet weak var RollDatePicker: UIDatePicker!

    @IBAction func DateApplyButton(_ sender: Any) {
        // 対戦掲示板に張り出すボタンを押した時に動く処理。自分の名前と日付をまとめpostする。responseが帰ってきたら，次の画面に移行する。

        let dateString = String(describing: RollDatePicker.date)
        //        let yearString = dateString.index(dateString.startIndex, offsetBy: 0, limitedBy: 3)  // コンパイルエラー，何故？
        let year = stringCutter(str: dateString, start:0, end:4)  // この辺のstart, endはstrをintに変換するために必要なもの。
        let month = stringCutter(str: dateString, start:5, end:7)
        let day = stringCutter(str: dateString, start:8, end:10)
        let hour = stringCutter(str: dateString, start:11, end:13)
        let min = stringCutter(str: dateString, start:14, end:16)
        
        debugPrint(dateString)
        debugPrint(year)
        debugPrint(month)
        debugPrint(day)
        debugPrint(hour)
        debugPrint(min)

        
        Alamofire.request("http://52.196.173.16/recruits.json", method: .post, parameters:[
            "applicant": testUser,
            "getup":
                ["year":year,
                 "month":month,
                 "day":day,
                 "hour":hour,
                 "min":min
            ]
            ]).responseJSON{ response in

                let responseJson = JSON(response.result.value!)
                debugPrint(responseJson)
                let recruitId = responseJson["id"].intValue// recruitsテーブルのid。
                let recruitGetup = responseJson["getup"].stringValue
                let recruitYear = self.stringCutter(str: recruitGetup, start:0, end:4)  // この辺のstart, endはstrをintに変換するために必要なもの。
                let recruitMonth = self.stringCutter(str: recruitGetup, start:5, end:7)
                let recruitDay = self.stringCutter(str: recruitGetup, start:8, end:10)
                let recruitHour = self.stringCutter(str: recruitGetup, start:11, end:13)
                let recruitMin = self.stringCutter(str: recruitGetup, start:14, end:16)
                
                let recruitMatchingDate = MatchingDate(year: recruitYear, month: recruitMonth, day: recruitDay, hour: recruitHour, min:recruitMin)
                let recruitMatch = NoOpponentMatching(recruitId: recruitId, applicant: "test1", matchingDate: recruitMatchingDate)
                
                var storyboard: UIStoryboard = self.storyboard!  // OpponentWaitingViewに画面遷移
                var nextView = storyboard.instantiateViewController(withIdentifier: "owv")
                self.present(nextView, animated: true, completion: nil)
                
      }
        

    }
    
    // 文字列から任意の文字列を取得し，Int型を返す関数
    func stringCutter(str: String, start: Int, end: Int) -> Int {
        let new = Int(str.substring(with: str.index(str.startIndex, offsetBy: start)..<str.index(str.startIndex, offsetBy: end)))
        return new!
    }
    
    
    
    

    
}
