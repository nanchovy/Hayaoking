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



class DateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    

    
    @IBOutlet weak var RollDatePicker: UIDatePicker!

    @IBAction func DateApplyButton(_ sender: Any) {
        // stringCutterという関数を作り，文字列から任意の文字列を取得しやすくした
        debugPrint(String(describing: RollDatePicker.date))
        let dateString = String(describing: RollDatePicker.date)
        //        let yearString = dateString.index(dateString.startIndex, offsetBy: 0, limitedBy: 3)  // コンパイルエラー，何故？
        let yearStr = stringCutter(str: dateString, start:0, end:4)
        let monthStr = stringCutter(str: dateString, start:5, end:7)
        let dayStr = stringCutter(str: dateString, start:8, end:10)
        let hourStr = stringCutter(str: dateString, start:14, end:16)
        let minStr = stringCutter(str: dateString, start:17, end:19)
        debugPrint(Int(yearStr)!)
        debugPrint(Int(monthStr)!)
        debugPrint(Int(dayStr)!)
        debugPrint(Int(hourStr)!)
        debugPrint(Int(minStr)!)
        
        
        let recruit = JSON(sampleMatching)
        debugPrint(recruit)
    }
    
    func stringCutter(str: String, start: Int, end: Int) -> String {
        let newStr = str.substring(with: str.index(str.startIndex, offsetBy: start)..<str.index(str.startIndex, offsetBy: end))
        return newStr
    }
    
    
    
    
//    func postRecruitJson() {
//    }
    
}
