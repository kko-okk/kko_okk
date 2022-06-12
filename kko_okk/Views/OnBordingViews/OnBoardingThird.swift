//
//  OnBoardingThird.swift
//  kko_okk
//
//  Created by Geunil Park on 2022/06/11.
//

import SwiftUI

struct OnBoardingThird: View {
    var promises: [PromiseModel] = PromiseModel.promises
    
    var body: some View {
        ZStack {
            Image("onBoarding")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.bottom, 100)
            HStack {
                ButtonForOnboarding(contract: promises[0], nowSubject: "parent")
                    .padding(.trailing, 145)
                
                Spacer()
                ButtonForOnboarding(contract: promises[1], nowSubject: "child")
                    .padding(.leading, 145)
            }
            .padding(.horizontal, 160)
            .padding(.bottom, 160)
        }
        .padding(120)
    }
}

struct OnBoardingThird_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingThird()
    }
}
