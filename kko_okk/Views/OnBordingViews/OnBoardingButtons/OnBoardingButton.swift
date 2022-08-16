//
//  OnBoardingButton.swift
//  kko_okk
//
//  Created by Geunil Park on 2022/06/14.
//

import SwiftUI

extension Animation {
    func `repeat`(while expression: Bool, autoreverses: Bool = true) -> Animation {
        if expression {
            return self.repeatForever(autoreverses: autoreverses)
        } else {
            return self
        }
    }
}

struct OnBoardingButton: View {
    @State private var animationAmount: CGFloat = 1
    var buttonText: String
    var nowSubject: String
    @Binding var parentPressed: Bool
    @Binding var childPressed: Bool
    @Binding var togetherPressed: Bool
    @State private var animationState = false
    @GestureState private var flag = true

    var body: some View {
        Text(buttonText)
            .font(.system(size: 20, weight: .semibold))
            .padding(.vertical, 10)
            .padding(.horizontal, KkookkSize.fullWidth / 34)
            .foregroundColor(textColor(now: nowSubject))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backGroundColor(now: nowSubject))
                    .frame(width: KkookkSize.fullWidth / 8, height: KkookkSize.fullHeight / 20)
                    .opacity(0.5)
                    .scaleEffect(animationState ? 1 : 1.2)
                    .animation(Animation.easeInOut(duration: 1).repeat(while: animationState), value: animationState)
                    .onLongPressGesture(minimumDuration: 2, maximumDistance: 100) {
                        if nowSubject == "parent" && childPressed == true {
                            togetherPressed = true
                        } else if nowSubject == "child" && parentPressed == true {
                            togetherPressed = true
                        }
                    } onPressingChanged: { inProgress in
                        if nowSubject == "parent" {
                            parentPressed = inProgress
                        } else if nowSubject == "child" {
                            childPressed = inProgress
                        }
                        animationState = inProgress ? false : true
                    }
            )
            .onAppear { if nowSubject != "contract" { self.animationState = true }}
    }

    private func backGroundColor(now nowSubject: String) -> Color {
        var result: Color  // result 변수는 Color 값이 들어감

        if nowSubject == "parent" {  // nowList 값이 parent와 같은 경우
            result = Color.Kkookk.onBoardingPurple
        } else if nowSubject == "child" {  // nowList 값이 parent가 아닌 경우
            result = Color.Kkookk.onBoardingGreen
        } else {
            result = Color.Kkookk.onBoardingYellow
        }
        return result
    }

    private func textColor(now nowSubject: String) -> Color {
        var result: Color  // result 변수는 Color 값이 들어감

        if nowSubject == "parent" {  // nowList 값이 parent와 같은 경우
            result = Color.Kkookk.parentPurple
        } else if nowSubject == "child" {  // nowList 값이 parent가 아닌 경우
            result = Color.Kkookk.childGreen
        } else {
            result = Color.Kkookk.commonYellow
        }
        return result
    }
}
