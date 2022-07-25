//
//  DateExtension.swift
//  kko_okk
//
//  Created by Geunil Park on 2022/06/18.
//

import Foundation
import SwiftUI

extension Date {
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }
    
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
    
    func startOftheMonth(now: Date) -> Date {
        let now: Date = now
        let dateFormatter = DateStruct.shared.kkookkDate()

        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let kr: String = dateFormatter.string(from: now)
        var temp: [Substring] = kr.split(separator: "-")
        temp[temp.count - 1] = "01"
        let result: String = temp.joined(separator: "-")
        
        return dateFormatter.date(from: result) ?? Date()
    }
    
    func endOftheMonth(now: Date) -> Date {
        let now: Date = now
        let dateFormatter = DateStruct.shared.kkookkDate()

        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let kr: String = dateFormatter.string(from: now)
        var temp: [Substring] = kr.split(separator: "-")
        temp[temp.count - 2] = Substring("0") + Substring(String(Int(temp[temp.count - 2])! == 12 ? 1 : Int(temp[temp.count - 2])! + 1))
        temp[temp.count - 1] = "01"
        let result: String = temp.joined(separator: "-")
        
        return dateFormatter.date(from: result) ?? Date()
    }
    
    func calcParentProgress(dailyPromises: FetchedResults<Promise>, now: Date) -> CGFloat {
        let dailyPromises = dailyPromises.filter{ Calendar.current.startOfDay(for: now) <= $0.madeTime && $0.madeTime <=  Calendar.current.startOfDay(for: now).dayAfter }
        
        let parentPromises: [Promise] = dailyPromises.filter { $0.subject == "parent"}
        
        let parentDoneCount: Int = parentPromises.filter { $0.isDone == true }.count
        
        let parentProgress: CGFloat = parentPromises.count != 0 ? CGFloat(Double(parentDoneCount) / Double(parentPromises.count) * 100) : 0
        
        
        return parentProgress
    }
    
    func calcChildProgress(dailyPromises: FetchedResults<Promise>, now: Date) -> CGFloat {
        let dailyPromises = dailyPromises.filter{ Calendar.current.startOfDay(for: now) <= $0.madeTime && $0.madeTime <=  Calendar.current.startOfDay(for: now).dayAfter }
        
        let childPromises: [Promise] = dailyPromises.filter { $0.subject == "child"}
        
        let childDoneCount: Int = childPromises.filter { $0.isDone == true }.count
        
        let childProgress: CGFloat = childPromises.count != 0 ? CGFloat(Double(childDoneCount) / Double(childPromises.count) * 100) : 0
        
        return childProgress
    }
}
