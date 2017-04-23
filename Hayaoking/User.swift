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
let battlesUrl: String = "http://localhost:3000/battles.json"

struct signUpUser {
    var name: String
}

struct User {
    var user_id: Int
    var name: String
    var win: Int
    var lose: Int
    var draw: Int
    var score: Int
    
    init(user_id: Int, name: String, win: Int=0, lose: Int=0, draw: Int=0, score: Int=0){
        self.user_id = user_id
        self.name = name
        self.win = win
        self.lose = lose
        self.draw = draw
        self.score = score
        
    }
}

let sampleUser = User(user_id: 30, name: "testname", win: 1, lose: 2, draw: 3, score: 4)

struct MatchingDate {
    var year: String
    var month: String
    var day: String
    var hour: String
    var min: String
    
}

struct Matching {
    var applicant: String
    var authorizer: String
    var matchingDate: MatchingDate
    
    init(applicant: String, authorizer: String, year: String, month: String, day:String, hour: String, min: String){
        self.applicant = applicant
        self.authorizer = authorizer
        self.matchingDate.year = year
        self.matchingDate.month = month
        self.matchingDate.day = day
        self.matchingDate.hour = hour
    }
}
