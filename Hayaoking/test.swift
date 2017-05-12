//
//  test.swift
//  Hayaoking
//
//  Created by 長安尚之 on 2017/04/25.
//  Copyright © 2017年 長安尚之. All rights reserved.
//
//  テスト用に，sampleとして作った変数などをまとめておいておく場所，本番では使わない

import Foundation

//let sampleMatching = Matching(applicant: "okYama", authorizer: "Yakuza", matchingDate: sampleMatchingDate)
// これはapplicant:"okYama"が既にrecruitsにあるため，エラーが起きる

//let sampleMatchingJSON = sampleMatching.toJson()

let sampleMatchingDate = MatchingDate(year: 2017, month: 4, day: 28, hour: 21, min:00)

//let sampleRecruitMatch = NoOpponentMatching(applicant: "test1", matchingDate: sampleMatchingDate)
