//
//  PromisePair.swift
//  kko_okk
//
//  Created by Yeni Hwang on 2022/06/17.
//

import Foundation

// 동일한 ID의 부모 Cell과 자식Cell들끼리만 인식할 수 있도록 만든 타입
class PromisePair {
    var promiseIDPair = [Promise.ID]()
    var promiseSubjectPair = [String]()

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

    // Subject 메서드
    func appendSubject(_ subject: String){
        promiseSubjectPair.append(subject)
    }

    func resetSubjectPair(){
        promiseSubjectPair.removeAll()
    }

    func getSubject(_ index: Int) -> String {
        return promiseSubjectPair[index]
    }
}

// pair들을 저장해서 사용하기 위한 전역 변수
var promisePair = PromisePair()
