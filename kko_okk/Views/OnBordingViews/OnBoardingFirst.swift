//
//  OnBoardingFirst.swift
//  kko_okk
//
//  Created by Geunil Park on 2022/06/11.
//

import SwiftUI

struct OnBoardingFirst: View {
    @Binding var selectedTag: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("안녕하세요 !")
                    .font(.system(size: 30, weight: .semibold))
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                Text("꼬옥은 부모님과 아이가 함께 약속을 만들고 지켜 나가며")
                    .font(.system(size: 20, weight: .light))
                Text("바람직한 생활 습관을 기를 수 있도록 도와줍니다.")
                    .font(.system(size: 20, weight: .light))
                Text("지금부터 꼬옥을 어떻게 사용하는지 간단하게 안내해 드리겠습니다.")
                    .font(.system(size: 20, weight: .light))
            }
            .padding(.bottom, 20)
            Text("시작하기")
                .font(.system(size: 20, weight: .semibold))
                .padding(.vertical, 10)
                .frame(width: KkookkSize.fullWidth / 2.17, height: KkookkSize.fullHeight / 18)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(10)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 1)) {
                        selectedTag = 1
                    }
                }
        }
    }
}

