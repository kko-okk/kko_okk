//
//  DailyReportData.swift
//  kko_okk
//
//  Created by ian on 2022/06/09.
//

import SwiftUI

struct DailyReportData: Identifiable {
    var id = UUID().uuidString
    var progress: CGFloat
    var assignment: String
    var keyColor: Color
}

// 화면 구현을 위한 목업 데이터
var dailyReportDatas: [DailyReportData] = [
    DailyReportData(progress: 50, assignment: "부모님", keyColor: Color("kkookkPurple")),
    DailyReportData(progress: 66, assignment: "아이", keyColor: Color("kkookkGreen"))
]
