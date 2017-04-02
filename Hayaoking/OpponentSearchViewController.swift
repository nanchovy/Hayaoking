//
//  OpponentSearchViewController.swift
//  Hayaoking
//
//  Created by 長安尚之 on 2017/04/02.
//  Copyright © 2017年 長安尚之. All rights reserved.
//

import UIKit

class OpponentSearchViewController: UIViewController, UISearchBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        opponentSearchText.delegate = self
        opponentSearchText.placeholder = "ユーザ名を検索できます"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBOutlet weak var opponentSearchText: UISearchBar!
    @IBOutlet weak var opponentTableView: UITableView!
    
    func searchBarSearchButtonClicked(_ opponentSearchBar: UISearchBar) {
        view.endEditing(true)
        print(opponentSearchBar.text ?? "入力なし")
    }
    
    func searchOpponent(keyword : String){
        // 第一引数：keyword 検索したいワード
        let keyword_encode = keyword.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        
        let URL = Foundation.URL(string: "URLを入れる")
    }
}
