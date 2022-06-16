//
//  Subject.swift
//  kko_okk
//
//  Created by Seodam on 2022/06/04.
//

import Foundation
import SwiftUI

enum Subject {
    case parent, child
}

// 받아온 subject 값(parent or child)에 맞는 포인트 컬러 생성.
func getPointColor(subject: Subject) -> Color {
    switch subject {
    case .parent:
        return Color.Kkookk.parentPurple
    case .child:
        return Color.Kkookk.childGreen
    }
}
