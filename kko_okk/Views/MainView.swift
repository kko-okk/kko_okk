//
//  MainView.swift
//  kko_okk
//
//  Created by Yeni Hwang on 2022/06/01.
//

import SwiftUI

struct MainView: View {
    @State var isShowingSettingView = false

    var body: some View {
        if isShowingSettingView {
            SettingView(isShowingSettingView: $isShowingSettingView)
        } else {
            ZStack{
                Color(hex:"#F5F7F9")
                    .ignoresSafeArea()
                VStack{
                    HeaderView()
                    SegmentView(isPressedSettingButton: $isShowingSettingView)
                }
            }
        }
    }
}
