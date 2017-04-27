//
//  BattleStandbyViewController.swift
//  Hayaoking
//
//  Created by 長安尚之 on 2017/03/28.
//  Copyright © 2017年 長安尚之. All rights reserved.
//

import UIKit

class BattleStandbyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = UserDefaults.standard
        
        let testa = userDefaults.bool(forKey: "applyButtle")
        
        debugPrint(testa)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
