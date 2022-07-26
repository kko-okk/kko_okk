//
//  OnBoardingButtonsViewModifier.swift
//  kko_okk
//
//  Created by 김제필 on 7/24/22.
//

import Foundation
import SwiftUI

// 온보딩 내 각 버튼의 UI를 정리한 View modifier
// 아쉽게도 Stack에는 적용되지 않는다.
struct ButtonTitleViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.Kkookk.cellTitle)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.leading, .trailing, .top], 20)
            .padding(.bottom, 5)
    }
}

struct EditButtonViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(90))
            .foregroundColor(.white)
            .frame(width: 40, height: 40)
            .padding(.top, 10)
    }
}

struct ButtonDetailedMemoViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.Kkookk.cellContent)
            .foregroundColor(Color.Kkookk.commonWhite)
            .lineLimit(3)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.leading, .bottom], 20)
            .padding(.trailing, 30)
            .padding(.top, 5)
    }
}
