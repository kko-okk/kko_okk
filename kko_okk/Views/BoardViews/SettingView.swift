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
        
        NavigationView{
            
            List {
                NavigationLink {
                    LicenseView()
                } label : {
                    Label("라이센스", systemImage: "star.fill")
                }
                
                NavigationLink {
                    EditView()
                } label : {
                    Label("설정", systemImage: "heart.fill")
                }
                
                NavigationLink {
                    LicenseView()
                } label : {
                    Label("푸시 알람", systemImage: "bolt.fill")
                }
                
                NavigationLink {
                    EditView()
                } label : {
                    Label("PlaceHolder", systemImage: "leaf.fill")
                }
                
                Button(action: {
                    isShowingSettingView.toggle()
                }, label: {
                    Text("돌아가기")
                })
                
            }
            .navigationTitle("설정")
            .navigationBarHidden(true)
            
            LicenseView()
        }
    }
}

//struct SettingView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingView()
//    }
//}
