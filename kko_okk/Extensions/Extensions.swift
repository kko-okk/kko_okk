//
//  Extensions.swift
//  kko_okk
//
//  Created by Ruyha on 2022/06/30.
//

import Foundation

// MARK: 로컬라이징을 위한 익스텐션

/*
 사용법
 기존       : var testTxt = NSLocalizedString("테스트문구입니다.",comment: "")
 extension : var testTxt = "테스트 문구입니다."localizable
 출처: https://zeddios.tistory.com/368
 */

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: "Localizable", value: self, comment: "")
    }
}
