//
//  OnBoardingTabView.swift
//  kko_okk
//
//  Created by Geunil Park on 2022/06/11.
//

import SwiftUI

struct OnBoardingTabView: View {
    var body: some View {
        TabView {
            OnBoardingFirst()
                .tag(0)
            OnBoardingSecond()
                .tag(1)
            OnBoardingThird()
                .tag(2)
            OnBoardingForth()
                .tag(3)
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct OnBoardingTabView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingTabView()
    }
}
