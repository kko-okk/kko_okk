//
//  OnBoardingSecond.swift
//  kko_okk
//
//  Created by Geunil Park on 2022/06/11.
//

import SwiftUI

struct OnBoardingSecond: View {
    @Binding var selectedTag: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("약속만들기")
                    .font(.system(size: 30, weight: .semibold))
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                Text("부모님과 아이가 원하는 임시 약속을 만듭니다.")
                    .font(.system(size: 20, weight: .light))
                Text("약속을 만들면 똑같은 내용이 부모님 셀과 아이 셀")
                    .font(.system(size: 20, weight: .light))
                Text("모두에서 나타납니다. 부모님과 아이는 임시 약속을 읽어보고,")
                    .font(.system(size: 20, weight: .light))
                Text("이것을 확실한 약속으로 만들것인지 합의합니다.")
                    .font(.system(size: 20, weight: .light))
            }
            .padding(.bottom, 20)
            Text("다음으로")
                .font(.system(size: 20, weight: .semibold))
                .padding(.vertical, 10)
                .padding(.horizontal, KkookkSize.fullWidth / 5.5)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(10)
                .onTapGesture {
                    selectedTag = 2
                }
        }
    }
}
