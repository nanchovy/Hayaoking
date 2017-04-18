//
//  API.swift
//  Hayaoking
//
//  Created by 長安尚之 on 2017/04/18.
//  Copyright © 2017年 長安尚之. All rights reserved.
//

import Foundation

enum API {
    case Initialize
    
    var url: String {
        let host: String = "http://localhost:3000"
        switch self {
        case .Users:
            return "\(host)/users.json"
        case .Battles:
            return "\(host)/battles.json"
        case .Recruits:
            return "\(host)/recruits.json"
        }
    }
}
