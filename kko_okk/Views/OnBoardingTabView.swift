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
            OnBoardingSecond()
            OnBoardingThird()
            OnBoardingForth()
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct OnBoardingTabView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingTabView()
    }
}
