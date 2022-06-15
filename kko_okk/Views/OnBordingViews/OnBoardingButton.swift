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
    @State private var flag = false
    @State private var durateTime: Double = 1.0
    var body: some View {
        Text(buttonText)
            .font(.system(size: 20, weight: .semibold))
            .padding(.vertical, 10)
            .padding(.horizontal, KkookkSize.fullWidth / 34)
            .foregroundColor(textColor(now: nowSubject))
//            .background(backGroundColor(now: nowSubject))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backGroundColor(now: nowSubject))
                    .frame(width: flag ? KkookkSize.fullWidth / 8 : KkookkSize.fullWidth / 7.7, height: flag ? 45 : 55, alignment: .center)
                    //animationAmount가 1이면 불트명이 1이고, 2이면 불투명도가 0이다
                    .opacity(0.5)
//                    .blur(radius: 4)
                    .animation(.easeInOut(duration: durateTime).repeatForever(autoreverses: true), value: flag)
        
                    .onTapGesture {
                        pressed.toggle()
                    }
            )
            
            .onAppear { self.flag = true }
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

