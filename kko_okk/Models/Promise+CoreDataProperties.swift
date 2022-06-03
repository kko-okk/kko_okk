//
//  Promise+CoreDataProperties.swift
//  kko_okk
//
//  Created by Geunil Park on 2022/06/02.
//
//

import Foundation
import CoreData


extension Promise {

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
    
    var wrappedName: String {
        name ?? "Unknown"
    }
    
    var wrappedMemo: String {
        memo ?? "Unknown"
    }
}

extension Promise : Identifiable {

}
