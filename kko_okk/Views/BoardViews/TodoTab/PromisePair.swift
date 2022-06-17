//
//  PromisePair.swift
//  kko_okk
//
//  Created by Yeni Hwang on 2022/06/17.
//

import Foundation

class PromisePair {
    var promiseIDPair = [Promise.ID]()
//    var promiseSubjectPair = [String]()
    
    init() { }
    
    // Pair 메서드
    func appendIDPair(_ item: Promise.ID){
        promiseIDPair.append(item)
    }
    
    func resetIDPair(){
        promiseIDPair.removeAll()
    }
    
    func getId(_ index: Int) -> Promise.ID {
        return promiseIDPair[index]
    }

    /*
    // Subject 메서드
    func appendSubject(_ subject: String){
        promiseSubjectPair.append(subject)
    }
        
    func resetSubjectPair(){
        promiseSubjectPair.removeAll()
    }
    
    func getSubject(_ index: Int) -> Promise.ID {
        return promiseIDPair[index]
    }
     */
}

var promisePair = PromisePair()
//var selectedParent: Bool = false
//var selectedChild: Bool = false

//class TicketOffice {
//    private var tickets = [Ticket]()
//
//    func getTicket() -> Ticket {
//        tickets.removeFirst()
//    }
//}
