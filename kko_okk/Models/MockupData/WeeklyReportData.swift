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
    var key: String
    var color: Color = Color.Kkookk.childGreen
}

struct CommonWeeklyReportData: Identifiable {
    var id = UUID().uuidString
    var assignment: String
    var keyColor: Color
}

var parentWeeklyReportDatas: [ParentWeeklyReportData] = [
    ParentWeeklyReportData(value: 75,
                           monthData: WeeklyDate.monthformat.string(from: WeeklyDate.todayMonth),
                           dayData: DailyDate.monthformat.string(from: DailyDate.todayDay.daySixDayBefore)),
    ParentWeeklyReportData(value: 30,
                           monthData: WeeklyDate.monthformat.string(from: WeeklyDate.todayMonth),
                           dayData: DailyDate.monthformat.string(from: DailyDate.todayDay.dayFiveDayBefore)),
    ParentWeeklyReportData(value: 50,
                           monthData: WeeklyDate.monthformat.string(from: WeeklyDate.todayMonth),
                           dayData: DailyDate.monthformat.string(from: DailyDate.todayDay.dayFourDayBefore)),
    ParentWeeklyReportData(value: 100,
                           monthData: WeeklyDate.monthformat.string(from: WeeklyDate.todayMonth),
                           dayData: DailyDate.monthformat.string(from: DailyDate.todayDay.dayThreeDayBefore)),
    ParentWeeklyReportData(value: 10,
                           monthData: WeeklyDate.monthformat.string(from: WeeklyDate.todayMonth),
                           dayData: DailyDate.monthformat.string(from: DailyDate.todayDay.dayTwoDayBefore)),
    ParentWeeklyReportData(value: 10,
                           monthData: WeeklyDate.monthformat.string(from: WeeklyDate.todayMonth),
                           dayData: DailyDate.monthformat.string(from: DailyDate.todayDay.dayOneDayBefore)),
    ParentWeeklyReportData(value: 10,
                           monthData: WeeklyDate.monthformat.string(from: WeeklyDate.todayMonth),
                           dayData: DailyDate.monthformat.string(from: DailyDate.todayDay))
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

var commonWeeklyReportDatas: [CommonWeeklyReportData] = [
    CommonWeeklyReportData(assignment: "부모님", keyColor: Color("kkookkPurple")),
    CommonWeeklyReportData(assignment: "아이", keyColor: Color("kkookkGreen"))
]

