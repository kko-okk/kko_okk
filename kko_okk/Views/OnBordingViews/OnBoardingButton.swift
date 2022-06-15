//
//  OnBoardingButton.swift
//  kko_okk
//
//  Created by Geunil Park on 2022/06/14.
//

import SwiftUI

struct OnBoardingButton: View {
    @State private var animationAmount: CGFloat = 1
    var buttonText: String
    var nowSubject: String
    @Binding var pressed: Bool
    
    var body: some View {
        Text(buttonText)
            .font(.system(size: 20, weight: .semibold))
            .padding(.vertical, 10)
            .padding(.horizontal, KkookkSize.fullWidth / 33)
            .foregroundColor(textColor(now: nowSubject))
            .background(backGroundColor(now: nowSubject))
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
            .onTapGesture {
                pressed.toggle()
            }
            .onAppear { self.animationAmount = 2 }
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

