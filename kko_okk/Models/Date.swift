//
//  WeeklyDate.swift
//  kko_okk
//
//  Created by 이성노 on 2022/06/12.
//

import SwiftUI

struct WeeklyDate {
    static let monthformat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "M월"
        return formatter
    }()
    static var todayMonth = Date()
}

struct DailyDate {
    static let monthformat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter
    }()
    static var todayDay = Date()
}

extension Date {
    var dayOneDayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
    var dayTwoDayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -2, to: self)!
    }
    var dayThreeDayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -3, to: self)!
    }
    var dayFourDayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -4, to: self)!
    }
    var dayFiveDayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -5, to: self)!
    }
    var daySixDayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -6, to: self)!
    }
}
