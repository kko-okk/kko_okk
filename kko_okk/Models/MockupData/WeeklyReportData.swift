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
    var key: String
    var color: Color = Color.Kkookk.parentPurple
}

struct ChildrenWeeklyReportData: Identifiable {
    var id = UUID().uuidString
    var value: CGFloat
    var key: String
    var color: Color = Color.Kkookk.childGreen
}

var parentWeeklyReportDatas: [ParentWeeklyReportData] = [
    ParentWeeklyReportData(value: 10, key: "6월 4일"),
    ParentWeeklyReportData(value: 50, key: "6월 5일"),
    ParentWeeklyReportData(value: 100, key: "6월 6일"),
    ParentWeeklyReportData(value: 100, key: "6월 7일"),
    ParentWeeklyReportData(value: 90, key: "6월 8일"),
    ParentWeeklyReportData(value: 100, key: "6월 9일"),
    ParentWeeklyReportData(value: 100, key: "6월 10일")
]

var childrenWeeklyReportDatas: [ChildrenWeeklyReportData] = [
    ChildrenWeeklyReportData(value: 40, key: "6월 4일"),
    ChildrenWeeklyReportData(value: 100, key: "6월 5일"),
    ChildrenWeeklyReportData(value: 46, key: "6월 6일"),
    ChildrenWeeklyReportData(value: 38, key: "6월 7일"),
    ChildrenWeeklyReportData(value: 59, key: "6월 8일"),
    ChildrenWeeklyReportData(value: 98, key: "6월 9일"),
    ChildrenWeeklyReportData(value: 100, key: "6월 10일"),
]

