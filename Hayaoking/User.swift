//
//  User.swift
//  Hayaoking
//
//  Created by 長安尚之 on 2017/04/05.
//  Copyright © 2017年 長安尚之. All rights reserved.
//

import Foundation
import SwiftyJSON

let url = "http://localhost:3000/users.json"

struct signUpUser {
    var name: String
}

struct User {
    var user_id: Int
    var name: String
    var win: Int = 0
    var lose: Int = 0
    var draw: Int = 0
    var score: Int = 0
    
    init(user_id: Int, name: String, win: Int, lose: Int, draw: Int, score: Int){
        self.user_id = user_id
        self.name = name
        self.win = win
        self.lose = lose
        self.draw = draw
        self.score = score
        
    }
}

let sampleUser = User(user_id: 30, name: "testname", win: 1, lose: 2, draw: 3, score: 4)
