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
    var year: Int
    var month: Int
    var day: Int
    var hour: Int
    var min: Int
    
    init(year: Int, month: Int, day: Int, hour: Int, min: Int) {
        self.year = year
        self.month = month
        self.day = day
        self.hour = hour
        self.min = min
    }
    
}



struct Matching {
    var applicant: String
    var authorizer: String
    var matchingDate: MatchingDate
    
    init(applicant: String, authorizer: String, matchingDate: MatchingDate) {
        self.applicant = applicant
        self.authorizer = authorizer
        self.matchingDate = matchingDate
//        self.matchingDate.year = year
//        self.matchingDate.month = month
//        self.matchingDate.day = day
//        self.matchingDate.hour = hour
        
    }
    
    func toJson() -> [String: Any] {
        let dict: [String: Any] =
            ["applicant": self.applicant,
             "authorizer": self.authorizer,
             "getup": [
                "year": self.matchingDate.year,
                "month": self.matchingDate.month,
                "day": self.matchingDate.day,
                "hour": self.matchingDate.hour,
                "min": self.matchingDate.min
                ]
        ]
        
        return dict
    }
}

struct NoOpponentMatching {
    var recruitId: Int
    var applicant: String
    var matchingDate: MatchingDate
    
    init(recruitId: Int, applicant: String, matchingDate: MatchingDate) {
        self.recruitId = recruitId
        self.applicant = applicant
        self.matchingDate = matchingDate

    }
    
    func toJson() -> [String: Any] {  // NoOpponentMatchingはユーザにおいておく確認用なので，toJsonはおそらく使わない
        let dict: [String: Any] =
            ["applicant": self.applicant,
             "getup": [
                "year": self.matchingDate.year,
                "month": self.matchingDate.month,
                "day": self.matchingDate.day,
                "hour": self.matchingDate.hour,
                "min": self.matchingDate.min
                ]
        ]
        
        return dict
    }
}


