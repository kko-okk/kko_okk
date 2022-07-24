//
//  OnBoardingSegmentView.swift
//  kko_okk
//
//  Created by 김제필 on 7/24/22.
//

import Foundation
import SwiftUI

// MARK: GeometryReader를 사용하기 위한 Preference 구조체 정의
// GeometryReader: 컨텐츠를 자신의 크기 및 좌표 공간의 함수로 정의하는 컨테이너 뷰.
//                 상위 뷰의 기하학적 정보(goemetric information)를 하위 뷰에 제공함.
// Preference: 하위 뷰의 정보를 상위 뷰로 전달.
//             [Key:value] 쌍을 뷰에 붙임(attach).
// PrefereceKey: 상위 뷰 - 하위 뷰 간 통신을 위한 프로토콜.
private struct SizeKey: PreferenceKey {
    static func reduce(value: inout CGSize?, nextValue: () -> CGSize?) {
        // reduce: SizeKey를 사용하는 하위 뷰를 순회하면서 값을 취합하기 위해 사용
        // nextValue: 값이 두 개 이상 있는 경우를 위한 파라미터
        value = value ?? nextValue()
    }
}

struct OnBoardingSegmentView: View {
    @State private var widthValue: CGFloat? = nil  // widthValue는 처음에는 정의되지 않으므로 nil에서 시작

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack {
                    Text("SegmentMakePromise".localized).foregroundColor(.Kkookk.commonBlack)
                        .font(Font.Kkookk.boardTabSelected)
                        .background(  // String의 실제 길이를 측정하기 위한 background 추가
                            GeometryReader { proxy in
                                Color.clear.preference(key: SizeKey.self, value: proxy.size)
                            }
                        )
                        .onPreferenceChange(SizeKey.self) { size in  // 하위 뷰에서 전달된 정보를 받음
                            self.widthValue = size?.width
                        }

                    Rectangle()
                        .foregroundColor(Color(hex: "DDDDDD"))
                        .frame(height: 2)
                        .padding(.top, -15)
                }

                VStack {
                    Text("SegmentFulfillmentRateView".localized)
                        .foregroundColor(.Kkookk.unselectedTabGray)
                        .font(Font.Kkookk.boardTabSelected)

                    Rectangle()
                        .foregroundColor(Color(hex: "FFFFFF"))
                        .frame(height: 2)
                        .padding(.top, -15)
                }
            }
        }
    }
}


struct OnBoardingSegmentView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingSegmentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
