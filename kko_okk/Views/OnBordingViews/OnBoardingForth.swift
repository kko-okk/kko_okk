//
//  OnBoardingForth.swift
//  kko_okk
//
//  Created by Geunil Park on 2022/06/11.
//

import SwiftUI

struct OnBoardingForth: View {
    @State private var animationAmount: CGFloat = 1
    @Binding var selectedTag: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("약속만들기")
                    .font(.system(size: 30, weight: .semibold))
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                Text("지금처럼, 부모님 셀과 아이 셀에서 같은 내용의 임시 약속을")
                    .font(.system(size: 20, weight: .light))
                Text("2초정도 꼬옥 누르면, 각각의 셀에서 임시 약속이 사라지고,")
                    .font(.system(size: 20, weight: .light))
                Text("가운데 부분으로 그 내용이 들어오게 됩니다 !")
                    .font(.system(size: 20, weight: .light))
            }
            .padding(.bottom, 20)
            
            HStack {
                Spacer()
                Divider()
                OnBoardingButton(buttonText: "우리의 약속", nowSubject: "contract")
                Divider()
                Spacer()
            }
            .frame(width: KkookkSize.fullWidth / 2.17, height: KkookkSize.fullHeight / 15)
            .padding(.bottom, 10)
            
            
            Text("약속하러 가기")
                .font(.system(size: 20, weight: .semibold))
                .padding(.vertical, 10)
                .padding(.horizontal, KkookkSize.fullWidth / 5.5)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(10)
        }
    }
}
