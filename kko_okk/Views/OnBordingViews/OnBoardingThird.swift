//
//  OnBoardingThird.swift
//  kko_okk
//
//  Created by Geunil Park on 2022/06/11.
//

import SwiftUI

struct OnBoardingThird: View {
    var body: some View {
        ZStack {
            Image("onBoarding")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.bottom, 100)
            HStack {
                Text("시작하기")
                    .font(.title3)
                    .padding(.vertical, 30)
                    .padding(.horizontal, 80)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(10)
                Spacer()
                Text("시작하기")
                    .font(.title3)
                    .padding(.vertical, 30)
                    .padding(.horizontal, 80)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 175)
            .padding(.bottom, 170)
        }
        .padding(120)
    }
}

struct OnBoardingThird_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingThird()
    }
}
