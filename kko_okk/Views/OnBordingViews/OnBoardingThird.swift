//
//  OnBoardingThird.swift
//  kko_okk
//
//  Created by Geunil Park on 2022/06/11.
//

import SwiftUI

struct OnBoardingThird: View {
    var promises: [PromiseModel] = PromiseModel.promises
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("약속만들기")
                    .font(.system(size: 30, weight: .semibold))
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                Text("우리가 약속을 할 때 새끼 손가락을 걸고 약속을 하듯,")
                    .font(.system(size: 20, weight: .light))
                Text("같은 내용의 셀을 꼬옥 2초 동안 누르면 합의된 약속을 나타내는 셀로")
                    .font(.system(size: 20, weight: .light))
                Text("약속이 옮겨갑니다. 지금 한 번 셀을 눌러보세요!")
                    .font(.system(size: 20, weight: .light))
            }
            .padding(.bottom, 10)
            
            HStack {
                Text("부모님의 약속")
                    .font(.system(size: 20, weight: .semibold))
                    .padding(.vertical, 10)
                    .padding(.horizontal, KkookkSize.fullWidth / 33)
                    .foregroundColor(Color.Kkookk.parentPurple)
                    .background(Color.Kkookk.onBoardingPurple)
                    .cornerRadius(10)
                    .overlay(
                        Circle()
                            .stroke(Color.yellow, lineWidth: 2)
                            .scaleEffect(animationAmount)
                            //animationAmount가 1이면 불트명이 1이고, 2이면 불투명도가 0이다
                            .opacity(Double(2 - animationAmount))
                            .animation(Animation.easeInOut(duration: 1)
                                                .repeatForever(autoreverses: false),
                                       value: animationAmount)
                    )
                    .onAppear { self.animationAmount = 2 }
                Divider()
                Spacer()
                Divider()
                Text("아이의 약속")
                    .font(.system(size: 20, weight: .semibold))
                    .padding(.vertical, 10)
                    .padding(.horizontal, KkookkSize.fullWidth / 33)
                    .foregroundColor(Color.Kkookk.childGreen)
                    .background(Color.Kkookk.onBoardingGreen)
                    .cornerRadius(10)
                    .overlay(
                        Circle()
                            .stroke(Color.yellow, lineWidth: 2)
                            .scaleEffect(animationAmount)
                            //animationAmount가 1이면 불트명이 1이고, 2이면 불투명도가 0이다
                            .opacity(Double(2 - animationAmount))
                            .animation(Animation.easeInOut(duration: 1)
                                                .repeatForever(autoreverses: false),
                                       value: animationAmount)
                    )
                    .onAppear { self.animationAmount = 2 }
            }
            .frame(width: KkookkSize.fullWidth / 2.17, height: KkookkSize.fullHeight / 15)
            .padding(.bottom, 10)
            
            Text("약속하러 가기")
                .font(.system(size: 20, weight: .semibold))
                .padding(.vertical, 10)
                .padding(.horizontal, KkookkSize.fullWidth / 5.5)
                .foregroundColor(.white)
                .background(Color.Kkookk.onBoardingGray)
                .cornerRadius(10)
        }
    }
}

struct OnBoardingThird_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingThird()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
