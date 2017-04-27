//
//  OpponentWaitingViewController.swift
//  Hayaoking
//
//  Created by 長安尚之 on 2017/04/26.
//  Copyright © 2017年 長安尚之. All rights reserved.
//
//  バトルリクエストを送った後に，承認が来るまで待機する画面。バトルリクエストのキャンセルもできる。


import UIKit

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
        
        
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    



}
