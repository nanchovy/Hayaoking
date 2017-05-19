//
//  RecruitCancelViewController.swift
//  Hayaoking
//
//  Created by 長安尚之 on 2017/04/28.
//  Copyright © 2017年 長安尚之. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Foundation

class RecruitCancelViewController: UIViewController {
    
    var owner: User?
    var matching: NoOpponentMatching?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        debugPrint("owner.userId")
        debugPrint(owner?.userId)
        debugPrint("matching.recruitId")
        debugPrint(matching?.recruitId)
        
//        let button1 = UIButton()
//        button1.frame = CGRect(x:60, y:300, width: 230, height:70)
//        button1.backgroundColor = UIColor.blue
//        button1.setTitle("日付を選択して申し込む", for: .normal)
//        button1.addTarget(self, action: #selector(OpponentWaitingViewController.toDVC(sender: )), for: .touchUpInside)
//        self.view.addSubview(button1)
//        
//        let button2 = UIButton()
//        button2.frame = CGRect(x:60, y:450, width: 230, height:70)
//        button2.backgroundColor = UIColor.blue
//        button2.setTitle("対戦申し込みを見る", for: .normal)
//        button2.addTarget(self, action: #selector(OpponentWaitingViewController.toOLVC(sender: )), for: .touchUpInside)
//        
//        self.view.addSubview(button2)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    @IBAction func confirmationButton(_ sender: Any) {
        debugPrint("Push C Button")
        let req = ["id": matching!.recruitId, "applicant_id": owner!.userId]
        print(req)
        Alamofire.request("http://52.196.173.16/recruits/show.json", method: .post, parameters: req).responseJSON{ response in
            do{
                debugPrint("do start")
                let userJson = JSON(response.result.value!)
                // userJson が存在すれば，battleを承認した人がいるので，alertを表示し，画面を遷移する
                var resultAlert = UIAlertController()
                self.alertInputter(alert: resultAlert, title: "対戦相手発見", message: "対戦が承認されました！目覚まし画面に移行します")
                let okAction = UIAlertAction(title: "OK", style: .default, handler: {
                    (action:UIAlertAction!) -> Void in
                    
                    let nextView = self.storyboard?.instantiateViewController(withIdentifier: "HBVC") as! HayaokiButtonViewController
                    nextView.owner = self.owner
                    let matching = Matching(id: userJson["id"].intValue, applicant: userJson["applicant"].stringValue, authorizer: userJson["authorizer"].stringValue, matchingDate: self.matching!.matchingDate)
                    nextView.matching = matching
                    self.present(nextView, animated: true, completion: nil)
                })
                resultAlert.addAction(okAction)
                self.present(resultAlert, animated: true, completion: nil)
            } catch {
                // userJsonが存在しなかったので，alertの表示のみ
                debugPrint("catchした")
            }
        }
    }
    
    @IBAction func cancelButton(_ sender: Any) {
    }

    
    func alertInputter(alert: UIAlertController, title: String, message: String) {
        alert.title = title
        alert.message = message
    }
}
