//
//  Promise+CoreDataProperties.swift
//  kko_okk
//
//  Created by Geunil Park on 2022/06/02.
//
//

import Foundation
import CoreData
import SwiftUI

extension Promise: Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Promise> {
        return NSFetchRequest<Promise>(entityName: "Promise")
    }

    @NSManaged public var childCheck: Bool
    @NSManaged public var id: UUID?
    @NSManaged public var isDone: Bool
    @NSManaged public var isRepeat: Bool
    @NSManaged public var madeTime: Date?
    @NSManaged public var memo: String?
    @NSManaged public var name: String?
    @NSManaged public var parentCheck: Bool
    @NSManaged public var promised: Bool
    @NSManaged public var repeatType: String?
    @NSManaged public var subject: String?
    
    // 약속 반복일
    @NSManaged public var isRepeatedOnMonday: Bool
    @NSManaged public var isRepeatedOnTuesday: Bool
    @NSManaged public var isRepeatedOnWednesday: Bool
    @NSManaged public var isRepeatedOnThursday: Bool
    @NSManaged public var isRepeatedOnFriday: Bool
    @NSManaged public var isRepeatedOnSaturday: Bool
    @NSManaged public var isRepeatedOnSunday: Bool
    
    
    var wrappedName: String {
        name ?? "Unknown"
    }
    
    var wrappedMemo: String {
        memo ?? "Unknown"
    }
    
    var dailyDatas: [DailyReportData] {
        [
            DailyReportData(progress: 50, assignment: "부모님", keyColor: Color("kkookkPurple")),
            DailyReportData(progress: 66, assignment: "아이", keyColor: Color("kkookkGreen"))
        ]
    }
}

