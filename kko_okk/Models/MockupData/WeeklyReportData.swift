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
    ParentWeeklyReportData(value: 70, key: "6월 4일"),
    ParentWeeklyReportData(value: 66, key: "6월 5일"),
    ParentWeeklyReportData(value: 80, key: "6월 6일"),
    ParentWeeklyReportData(value: 53, key: "6월 7일"),
    ParentWeeklyReportData(value: 97, key: "6월 8일"),
    ParentWeeklyReportData(value: 23, key: "6월 9일"),
    ParentWeeklyReportData(value: 90, key: "6월 10일")
]

var childrenWeeklyReportDatas: [ChildrenWeeklyReportData] = [
    ChildrenWeeklyReportData(value: 60, key: "6월 4일"),
    ChildrenWeeklyReportData(value: 50, key: "6월 5일"),
    ChildrenWeeklyReportData(value: 23, key: "6월 6일"),
    ChildrenWeeklyReportData(value: 65, key: "6월 7일"),
    ChildrenWeeklyReportData(value: 36, key: "6월 8일"),
    ChildrenWeeklyReportData(value: 48, key: "6월 9일"),
    ChildrenWeeklyReportData(value: 56, key: "6월 10일"),
]

