//
//  PromiseModel.swift
//  kko_okk
//
//  Created by Geunil Park on 2022/06/12.
//

import Foundation

struct PromiseModel: Identifiable {
    var childCheck: Bool
    var id: UUID
    var isDone: Bool
    var isRepeat: Bool
    var madeTime: Date
    var memo: String
    var name: String
    var parentCheck: Bool
    var promised: Bool
    var repeatType: String
    var subject: String
    
    // 약속 반복일
    var isRepeatedOnMonday: Bool
    var isRepeatedOnTuesday: Bool
    var isRepeatedOnWednesday: Bool
    var isRepeatedOnThursday: Bool
    var isRepeatedOnFriday: Bool
    var isRepeatedOnSaturday: Bool
    var isRepeatedOnSunday: Bool
}

extension PromiseModel {
    static var promises: [PromiseModel] {
        [
            PromiseModel(childCheck: false, id: UUID(), isDone: false, isRepeat: false, madeTime: Date(), memo: "Memo", name: "name", parentCheck: false, promised: false, repeatType: "Hi", subject: "parent", isRepeatedOnMonday: false, isRepeatedOnTuesday: false, isRepeatedOnWednesday: false, isRepeatedOnThursday: false, isRepeatedOnFriday: false, isRepeatedOnSaturday: false, isRepeatedOnSunday: false),
            PromiseModel(childCheck: false, id: UUID(), isDone: false, isRepeat: false, madeTime: Date(), memo: "Memo", name: "name", parentCheck: false, promised: false, repeatType: "Hi", subject: "parent", isRepeatedOnMonday: false, isRepeatedOnTuesday: false, isRepeatedOnWednesday: false, isRepeatedOnThursday: false, isRepeatedOnFriday: false, isRepeatedOnSaturday: false, isRepeatedOnSunday: false),
        ]
    }
}
