//
//  WeeklyReportData.swift
//  kko_okk
//
//  Created by ian on 2022/06/10.
//

import SwiftUI

struct ParentWeeklyReportData: Identifiable {
    var id = UUID().uuidString
    var value: CGFloat
    var monthData: String
    var dayData: String
    var color: Color = Color.Kkookk.parentPurple
}

struct ChildrenWeeklyReportData: Identifiable {
    var id = UUID().uuidString
    var value: CGFloat
    var monthData: String
    var dayData: String
    var color: Color = Color.Kkookk.childGreen
}

struct CommonWeeklyReportData: Identifiable {
    var id = UUID().uuidString
    var assignment: String
    var keyColor: Color
}

var commonWeeklyReportDatas: [CommonWeeklyReportData] = [
    CommonWeeklyReportData(assignment: "부모님", keyColor: Color("kkookkPurple")),
    CommonWeeklyReportData(assignment: "아이", keyColor: Color("kkookkGreen"))
]

