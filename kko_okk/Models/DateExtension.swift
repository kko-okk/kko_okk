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
    
    var startOftheMonth: Date {
        let now: Date = Date()
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_kr")
        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
        dateFormatter.dateFormat = "dd"
        
        let kr: String = dateFormatter.string(from: now)
        let today: Int = Int(kr) ?? 0
        
        return Calendar.current.date(byAdding: .day, value: 1-today, to: self)!
    }
}
