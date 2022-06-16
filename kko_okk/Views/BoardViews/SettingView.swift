//
//  SettingView.swift
//  kko_okk
//
//  Created by Yeni Hwang on 2022/06/02.
//

import SwiftUI

struct SettingView: View {
    @Binding var isShowingSettingView: Bool
    
    var body: some View {
        Spacer()
        Button(action: {
            isShowingSettingView.toggle()
        }, label: {
            Text("돌아가기")
        })
        Text("Setting View")
        Spacer()
    }
}

//struct SettingView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingView()
//    }
//}
