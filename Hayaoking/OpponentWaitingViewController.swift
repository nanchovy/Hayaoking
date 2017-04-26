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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        debugPrint()
        
        var showStatusLabel = UILabel()
        showStatusLabel.text = "hoge"
        showStatusLabel.numberOfLines = 0
        showStatusLabel.sizeToFit()
        showStatusLabel.center =  self.view.center
        self.view.addSubview(showStatusLabel)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    


}
