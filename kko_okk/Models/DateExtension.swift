//
//  DateExtension.swift
//  kko_okk
//
//  Created by Geunil Park on 2022/06/18.
//

import Foundation

extension Date {
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }
    
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
    
    func startOftheMonth(now: Date) -> Date {
        let now: Date = now
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_kr")
        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let kr: String = dateFormatter.string(from: now)
        var temp: [Substring] = kr.split(separator: "-")
        temp[temp.count - 1] = "01"
        let result: String = temp.joined(separator: "-")
        
        return dateFormatter.date(from: result) ?? Date()
    }
    
    func endOftheMonth(now: Date) -> Date {
        let now: Date = now
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_kr")
        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let kr: String = dateFormatter.string(from: now)
        var temp: [Substring] = kr.split(separator: "-")
        temp[temp.count - 2] = Substring("0") + Substring(String(Int(temp[temp.count - 2])! == 12 ? 1 : Int(temp[temp.count - 2])! + 1))
        temp[temp.count - 1] = "01"
        let result: String = temp.joined(separator: "-")
        
        return dateFormatter.date(from: result) ?? Date()
    }
}
