//
//  Font.swift
//  kko_okk
//
//  Created by Yeni Hwang on 2022/06/03.
//

import SwiftUI

// 사용 예시 : Text("꼬옥").font(.Kkookk.headerDate)

enum AppleSDGothicNeoWeight: String {
    case ultraLight = "AppleSDGothicNeoUL00"
    case thin = "AppleSDGothicNeoT00"
    case light = "AppleSDGothicNeoL00"
    case regular = "AppleSDGothicNeoR00"
    case medium = "AppleSDGothicNeoM00"
    case semiBold = "AppleSDGothicNeoSB00"
    case bold = "AppleSDGothicNeoB00"
    case extraBold = "AppleSDGothicNeoEB00"
    case heavy = "AppleSDGothicNeoH00"
}


extension Font {
    enum Kkookk {
        static var headerDefaultTitle :Font {
            Font.kkookkFont(weight: .regular, size: KkookkSize.fullHeight > 1000 ? 30.0 : 25.0)
        }//화면 크기에 따라 폰트가 달라짐
        
        static var headerDate: Font { Font.kkookkFont(weight: .light, size: 20) }
        
        // BoardView - Tab
        static var boardTabSelected: Font { Font.kkookkFont(weight: .bold, size: 20) }
        static var boardTabUnselected: Font { Font.kkookkFont(weight: .bold, size: 19) }
        static var boardSettingButton: Font { Font.kkookkFont(weight: .bold, size: 16) }
        
        // BoardView - Table
        static var tableTitle: Font { Font.kkookkFont(weight: .bold, size: 20) }
        static var tableCountBadge: Font { Font.kkookkFont(weight: .bold, size: 16) }
        
        // BoardView - Cell
        static var cellTitle: Font { Font.kkookkFont(weight: .extraBold, size: 23) }
        static var cellContent: Font { Font.kkookkFont(weight: .regular, size: 16) }
        
        // AddPromisePopover, EditPromisePopover, EditContentsOfPromiseView, EditRepeatingDaysOfPromiseView
        static var popoverNavigationTitle: Font { Font.kkookkFont(weight: .bold, size: 24) }
        static var popoverNavigationButton: Font { Font.kkookkFont(weight: .regular, size: 24) }
        static var popoverTitle: Font { Font.kkookkFont(weight: .bold, size: 20) }
        static var popoverName: Font { Font.kkookkFont(weight: .regular, size: 16) }
        static var popoverMemo: Font { Font.kkookkFont(weight: .light, size: 16) }
        static var popoverDays: Font { Font.kkookkFont(weight: .regular, size: 16) }
        
        // DailyReportView - Cell
        static var dailyReportViewMainCell: Font { Font.kkookkFont(weight: .semiBold, size: 16) }
        static var dailyReportViewContentCell: Font { Font.kkookkFont(weight: .semiBold, size: 15) }
        
        // WeeklyReportView - Cell
        static var weeklyReportViewMainCell: Font { Font.kkookkFont(weight: .regular, size: 16) }
        static var weeklyReportViewContentCell: Font { Font.kkookkFont(weight: .light, size: 14) }
        
    }
}

private extension Font {
    static func kkookkFont(weight: AppleSDGothicNeoWeight, size: CGFloat) -> Font {
        Font.custom(weight.rawValue, size: size)
    }
}
