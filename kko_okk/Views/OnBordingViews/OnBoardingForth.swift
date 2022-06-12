//
//  OnBoardingForth.swift
//  kko_okk
//
//  Created by Geunil Park on 2022/06/11.
//

import SwiftUI

struct OnBoardingForth: View {
    var promises: [PromiseModel] = PromiseModel.promises
    var body: some View {
        ZStack {
            Image("onBoarding")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.bottom, 100)
            HStack {
                ButtonForOnboarding(contract: promises[0], nowSubject: "parent")
                    .padding(.horizontal, 430)
            }
            .padding(.bottom, 170)
        }
        .padding(120)
    }
}

struct OnBoardingForth_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingForth()
    }
}
