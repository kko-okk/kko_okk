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
            VStack(alignment: .leading,spacing: 10) {
                Text("OnBoardingSecondTitle".localized)
                    .font(.system(size: 30, weight: .semibold))
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                Text("OnBoardingSecondBody1".localized)
                    .font(.system(size: 20, weight: .light))
                Text("OnBoardingSecondBody2".localized)
                    .font(.system(size: 20, weight: .light))
                Text("OnBoardingSecondBody3".localized)
                    .font(.system(size: 20, weight: .light))
                Text("OnBoardingSecondBody4".localized)
                    .font(.system(size: 20, weight: .light))
                Text("OnBoardingSecondBody5".localized)
                    .font(.system(size: 20, weight: .light))
            }
            .padding(.bottom, 20)

            Text("OnBoardingNext".localized)
                .font(.system(size: 20, weight: .semibold))
                .padding(.vertical, 10)
                .frame(width: KkookkSize.fullWidth / 2.17, height: KkookkSize.fullHeight / 18)
                .foregroundColor(Color.Kkookk.commonWhite)
                .background(.blue)
                .cornerRadius(10)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 1)) {
                        selectedTag = 2
                    }
                }
        }
    }
}
