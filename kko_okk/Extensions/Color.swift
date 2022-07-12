//
//  Color.swift
//  kko_okk
//
//  Created by Yeni Hwang on 2022/06/03.
//

import SwiftUI

// 사용 예시 : Text("꼬옥").foregroundColor(.Kkookk.parentPurple)

extension Color {
    enum Kkookk{
        static var parentPurple: Color { Color("kkookkPurple") }
        static var childGreen: Color { Color("kkookkGreen") }
        static var commonBlack: Color { Color("kkookkBlack") }
        static var commonWhite: Color { Color("kkookkWhite")}
        static var commonYellow: Color { Color("kkookkYellow") }
        static var unselectedTabGray: Color { Color("gray1") }
        static var tabDividerGray: Color { Color("gray2") }
        static var countBadgeGray: Color { Color("gray3") }
        static var tableDividerGray: Color { Color("gray4") }
        static var backgroundGray: Color { Color("gray5") }
        static var onBoardingGray: Color { Color("gray6") }
        static var onBoardingPurple: Color { Color("onBoardingPurple") }
        static var onBoardingGreen: Color { Color("onBoardingGreen") }
        static var onBoardingYellow: Color { Color("onBoardingYellow") }
    }
}
