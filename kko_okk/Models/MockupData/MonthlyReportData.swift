//
//  MonthlyReportData.swift
//  kko_okk
//
//  Created by 이성노 on 2022/06/14.
//

import SwiftUI

struct DateValue: Identifiable {
    var id = UUID().uuidString
    var day: Int
    var date: Date
}

struct MonthlyReportDataTask: Identifiable {
    var id = UUID().uuidString
    var title: String
    var time: Date
    var subject: String
}

struct MonthlyReportDataTaskMetaData: Identifiable {
    var id = UUID().uuidString
    var task: [Promise]
    var taskDate: Date
}

func getSampleDate(offset: Int) -> Date {
    let calender = Calendar.current
    let date = calender.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}
