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
        }
        else {
            HeaderView()
            SegmentView(isPressedSettingButton: $isShowingSettingView)
        }
            
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
