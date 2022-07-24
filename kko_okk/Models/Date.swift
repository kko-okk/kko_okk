//
//  WeeklyDate.swift
//  kko_okk
//
//  Created by 이성노 on 2022/06/12.
//

import SwiftUI


//MARK: Date형식을 맞추려고 추가 by Ruyha
struct DateStruct{
    static let shared = DateStruct()
    
    func kkookkDate() -> DateFormatter{
        let formatter = DateFormatter()
        let userLocale = Locale.current
        formatter.locale = Locale(identifier: "\(userLocale)")
        formatter.timeZone = TimeZone(abbreviation: "\(TimeZone.current.identifier)")
        return formatter
    }
}

struct WeeklyDate {
    static let monthformat: DateFormatter = {
        let formatter = DateStruct.shared.kkookkDate()
        formatter.dateFormat = "MMM"
        return formatter
    }()
    static var todayMonth = Date()
}

struct DailyDate {
    static let monthformat: DateFormatter = {
        let formatter = DateStruct.shared.kkookkDate()
        formatter.dateFormat = "dd"
        return formatter
    }()
   static var todayDay = Date()
}

extension Date {
    var dayOneDayBefore: Date {
        print("dayOneDayBefore : \(Calendar.current.date(byAdding: .day, value: -1, to: self)!)")
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
    var dayTwoDayBefore: Date {
        print("dayTwoDayBefore : \(Calendar.current.date(byAdding: .day, value: -2, to: self)!)")

        return Calendar.current.date(byAdding: .day, value: -2, to: self)!
    }
    var dayThreeDayBefore: Date {
        print("dayThreeDayBefore : \(Calendar.current.date(byAdding: .day, value: -3, to: self)!)")

        return Calendar.current.date(byAdding: .day, value: -3, to: self)!
    }
    var dayFourDayBefore: Date {
        print("dayFourDayBefore : \(Calendar.current.date(byAdding: .day, value: -4, to: self)!)")
        return Calendar.current.date(byAdding: .day, value: -4, to: self)!
    }
    var dayFiveDayBefore: Date {
        print("dayFiveDayBefore : \(Calendar.current.date(byAdding: .day, value: -5, to: self)!)")
        return Calendar.current.date(byAdding: .day, value: -5, to: self)!
    }
    var daySixDayBefore: Date {
        print("daySixDayBefore : \(Calendar.current.date(byAdding: .day, value: -6, to: self)!)")
        return Calendar.current.date(byAdding: .day, value: -6, to: self)!
    }
}
