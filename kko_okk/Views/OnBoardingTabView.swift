//
//  OnBoardingTabView.swift
//  kko_okk
//
//  Created by Geunil Park on 2022/06/11.
//

import SwiftUI

struct OnBoardingTabView: View {
    @State var selectedTag: Int
    @Binding var isFirstLaunching: Bool
    
    var body: some View {
        TabView(selection: $selectedTag) {
            OnBoardingFirst(selectedTag: $selectedTag)
                .tag(0)
            OnBoardingSecond(selectedTag: $selectedTag)
                .tag(1)
            OnBoardingThird(selectedTag: $selectedTag)
                .tag(2)
            OnBoardingForth(selectedTag: $selectedTag, isFirstLaunching: $isFirstLaunching)
                .tag(3)
        }
        .tabViewStyle(PageTabViewStyle())
    }
}
