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
                VStack(alignment: .leading,spacing: 10) {
                    Text("OnBoardingThirdTitle".localized)
                        .font(.system(size: 30, weight: .semibold))
                        .fontWeight(.bold)
                        .padding(.bottom, 10)
                    Text("OnBoardingThirdBody1".localized)
                        .font(.system(size: 20, weight: .light))
                    Text("OnBoardingThirdBody2".localized)
                        .font(.system(size: 20, weight: .light))
                    Text("OnBoardingThirdBody3".localized)
                        .font(.system(size: 20, weight: .light))
                    Text("OnBoardingThirdBody4".localized)
                        .font(.system(size: 20, weight: .light))
                    Text("OnBoardingThirdBody5".localized)
                        .font(.system(size: 20, weight: .light))
                }
                .padding(.bottom, 10)
                VStack(alignment: .center) {
                    HStack {
                        OnBoardingButton(buttonText: "OnBoardingThirdParent".localized, nowSubject: "parent", parentPressed: $isParentPressing, childPressed: $isChildPressing, togetherPressed: $isTogetherPressed)
                            .opacity(isTogetherPressed == true ? 0 : 1)
                        Spacer()
                        Divider()
                        Spacer()
                        OnBoardingButton(buttonText: "OnBoardingThirdContract".localized, nowSubject: "contract", parentPressed: $isParentPressing, childPressed: $isChildPressing, togetherPressed: $isTogetherPressed)
                            .opacity(isTogetherPressed == true ? 1 : 0)
                        Spacer()
                        Divider()
                        Spacer()
                        OnBoardingButton(buttonText: "OnBoardingThirdChild".localized, nowSubject: "child", parentPressed: $isParentPressing, childPressed: $isChildPressing, togetherPressed: $isTogetherPressed)
                            .opacity(isTogetherPressed == true ? 0 : 1)
                    }
                    .frame(width: KkookkSize.fullWidth / 2.17, height: KkookkSize.fullHeight / 15)
                    .padding(.bottom, 10)
                    
                    VStack {
                        Text("OnBoardingNext".localized)
                            .font(.system(size: 20, weight: .semibold))
                            .padding(.vertical, 10)
                            .frame(width: KkookkSize.fullWidth / 2.17, height: KkookkSize.fullHeight / 18)
                            .foregroundColor(Color.Kkookk.commonWhite)
                            .background(isTogetherPressed == true ? .blue : Color.Kkookk.onBoardingGray)
                            .cornerRadius(10)
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 1)) {
                                    selectedTag = 3
                                }
                            }
                    }
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

