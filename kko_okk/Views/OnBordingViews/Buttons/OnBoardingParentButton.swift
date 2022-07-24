//
//  OnBoardingParentButton.swift
//  kko_okk_test
//
//  Created by 김제필 on 7/23/22.
//

import Foundation
import SwiftUI

struct OnBoardingParentButton: View {
    @State private var enabled = false

    var body: some View {
        ZStack {
            VStack {  // 타이틀 + 에디트 버튼
                HStack {
                    Text("롯데월드 가기")
                            .modifier(ButtonTitleViewModifier())

                    Image(systemName: "ellipsis")
                            .modifier(EditButtonViewModifier())
                }

                // 세부 내용
                Text("이번 주 금요일까지 밀린 숙제 모두 끝마치면 토요일에 롯데월드")
                        .modifier(ButtonDetailedMemoViewModifier())
            }
        }
                .background(.purple)
                .clipShape(RoundedRectangle(cornerRadius: 15.0, style: .continuous))
    }
}
