//
//  OnBoardingSecond.swift
//  kko_okk
//
//  Created by Geunil Park on 2022/06/11.
//

import SwiftUI

struct OnBoardingSecond: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("약속 만들기 !")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                Text("부모님과 아이가 원하는 임시 약속을 만듭니다.")
                Text("약속을 만들면 똑같은 내용이 부모님 셀과 아이 셀 모두에서 나타납니다.")
                Text("부모님과 아이는 임시 약속을 읽어보고, ")
                Text("이것을 확실한 약속으로 만들것인지 합의합니다.")
            }
            .padding(.bottom, 20)
            Text("다음으로")
                .font(.title3)
                .padding(.vertical, 10)
                .padding(.horizontal, 150)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(10)
        }
    }
}

struct OnBoardingSecond_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingSecond()
    }
}
