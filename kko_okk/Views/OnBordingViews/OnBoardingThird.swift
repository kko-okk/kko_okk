//
//  OnBoardingThird.swift
//  kko_okk
//
//  Created by Geunil Park on 2022/06/11.
//

import SwiftUI

struct OnBoardingThird: View {
    @Binding var selectedTag: Int
    @State var now: Int = 0
    @State var isFatherPressing: Bool = false
    @State var isChildPressing: Bool = false
    @State var perfectCircle: CGFloat = 0
    @State var fill: CGFloat = 0
    
    var body: some View {
        ZStack {
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
                    OnBoardingButton(buttonText: "부모님의 약속", nowSubject: "parent", pressed: $isFatherPressing)
                    Divider()
                    Spacer()
                    Divider()
                    OnBoardingButton(buttonText: "아이의 약속", nowSubject: "child", pressed: $isChildPressing)
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
            
            Circle()
                .trim(from: 0, to: self.fill)
                .stroke(Color.Kkookk.parentPurple, style: StrokeStyle(lineWidth: 20))
                .frame(width: 250, height: 250)
                .rotationEffect(.init(degrees: -90))
                .animation(Animation.linear(duration: 3), value: fill)
                
            if isChildPressing == true {
                if isFatherPressing == true {
                    Circle()
                        .fill(Color.Kkookk.backgroundGray)
                        .frame(width: 250, height: 250)
                    Text("잠시만 기다려주세요 !")
                        .onAppear {
                            self.fill = 1.0
                        }
                } else {
                    Circle()
                        .fill(Color.Kkookk.backgroundGray)
                        .frame(width: 250, height: 250)
                    Text("두 버튼을 다 눌러주세요.")
                        .onAppear() {
                            self.fill = 0
                        }
                }
            } else {
                if isChildPressing == true {
                    Circle()
                        .fill(Color.Kkookk.backgroundGray)
                        .frame(width: 250, height: 250)
                    Text("잠시만 기다려주세요 !")
                        .onAppear {
                            self.fill = 1.0
                        }
                } else {
                    Circle()
                        .fill(Color.Kkookk.backgroundGray)
                        .frame(width: 250, height: 250)
                    Text("두 버튼을 다 눌러주세요.")
                        .onAppear() {
                            self.fill = 0
                        }
                }
            }
        }
    }
    
    func tracingTrim(father fatherPressed: Bool, child childPressed: Bool) -> CGFloat {
        var result: CGFloat = 0
        if fatherPressed == true && childPressed == true {
            result = 1.0
        }
        return result
    }
}

