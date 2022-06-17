//
//  PromisePair.swift
//  kko_okk
//
//  Created by Yeni Hwang on 2022/06/17.
//

import Foundation

class PromisePair {
    var promiseIDPair = [Promise.ID]()
    
    init() { }
    
    func append(_ item: Promise.ID){
        promiseIDPair.append(item)
    }
    
    func reset(){
        promiseIDPair.removeAll()
    }
    
    func get(_ index: Int) -> Promise.ID {
        return promiseIDPair[index]
    }
    
    func count() -> Int {
        let count = promiseIDPair.count
        return count
    }
}

var idPair = PromisePair()
var selectedParent: Bool = false
var selectedChild: Bool = false

//class TicketOffice {
//    private var tickets = [Ticket]()
//
//    func getTicket() -> Ticket {
//        tickets.removeFirst()
//    }
//}
