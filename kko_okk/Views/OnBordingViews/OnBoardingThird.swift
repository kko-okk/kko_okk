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
    @State var isParentPressing: Bool = false
    @State var isChildPressing: Bool = false
    @State var isContractPressed: Bool = false
    @State var perfectCircle: CGFloat = 0
    @State var fill: CGFloat = 0
    @State var isTogetherPressed: Bool = false
    
    @State private var timeRemaining = 2
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
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
                VStack(alignment: .center) {
                    HStack {
                        OnBoardingButton(buttonText: "부모님 약속", nowSubject: "parent", parentPressed: $isParentPressing, childPressed: $isChildPressing, togetherPressed: $isTogetherPressed)
                            .opacity(isTogetherPressed == true ? 0 : 1)
                        Spacer()
                        Divider()
                        Spacer()
                        OnBoardingButton(buttonText: "우리의 약속", nowSubject: "contract", parentPressed: $isParentPressing, childPressed: $isChildPressing, togetherPressed: $isTogetherPressed)
                            .opacity(isTogetherPressed == true ? 1 : 0)
                        Spacer()
                        Divider()
                        Spacer()
                        OnBoardingButton(buttonText: "아이의 약속", nowSubject: "child", parentPressed: $isParentPressing, childPressed: $isChildPressing, togetherPressed: $isTogetherPressed)
                            .opacity(isTogetherPressed == true ? 0 : 1)
                    }
                    .frame(width: KkookkSize.fullWidth / 2.17, height: KkookkSize.fullHeight / 15)
                    .padding(.bottom, 10)
                    
                    Button("다음으로") {
                        withAnimation(.easeInOut(duration: 1)){
                            selectedTag = 3
                        }
                    }
                    .font(.system(size: 20, weight: .semibold))
                    .padding(.vertical, 10)
                    .frame(width: KkookkSize.fullWidth / 2.17, height: KkookkSize.fullHeight / 18)
                    .foregroundColor(.white)
                    .background(isTogetherPressed == true ? .blue : Color.Kkookk.onBoardingGray)
                    .cornerRadius(10)
                    .disabled(isTogetherPressed == false)
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

