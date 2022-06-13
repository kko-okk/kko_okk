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

struct Task: Identifiable {
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
}

struct TaskMetaData: Identifiable {
    var id = UUID().uuidString
    var task: [Task]
    var taskDate: Date
}

func getSampleDate(offset: Int) -> Date {
    let calender = Calendar.current
    let date = calender.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}

var tasks: [TaskMetaData] = [
    TaskMetaData(task: [
        Task(title: "안녕하세요 시험해봅니다?"),
        Task(title: "반갑습니다 뛰어봅니다?"),
        Task(title: "누구세요? 팩폭해봅니다?")
    ], taskDate: getSampleDate(offset: 1)),
    
    TaskMetaData(task: [
        Task(title: "지금은 넬 노래를 듣고있어요")
    ], taskDate: getSampleDate(offset: -3)),
    
    TaskMetaData(task: [
        Task(title: "참새랑 고양이랑 한 가운데에서 놀고있어요")
    ], taskDate: getSampleDate(offset: -8)),
    
    TaskMetaData(task: [
        Task(title: "마지막으로 씁니다.")
    ], taskDate: getSampleDate(offset: 10))
]
