//
//  SettingView.swift
//  kko_okk
//
//  Created by Yeni Hwang on 2022/06/02.
//

import SwiftUI

struct SettingView: View {
    @Binding var isShowingSettingView: Bool
    
    // Setting View
    var body: some View {
        
        NavigationView{
            Form {
                NavigationLink {
                    LicenseView()
                } label : {
                    Label("라이센스", systemImage: "star.fill")
                }
                
                NavigationLink(destination: MyWebView(urlToLoad: "https://github.com/yeniful/kko_okk").navigationTitle("GitHub")) {
                    HStack{
                        Image("GitHub")
                        Text("GitHub")
                    }
                }
//                ppapMailView
                
                NavigationLink {
                    ppapMailView()
                } label : {
                    Label("버그신고", systemImage: "star.fill")
                }
                
                
                Section(header: Text("개발자 정보")){
                    NavigationLink(destination: MyWebView(urlToLoad: "https://github.com/Valentino1994").navigationTitle("Guell")) {
                        Text("Guell")
                    }
                    NavigationLink(destination: MyWebView(urlToLoad: "https://github.com/LeeSungNo-ian").navigationTitle("Ian")) {
                        HStack{
                            Image("Ian")
                            Text("Ian")
                        }
                    }
                    
                    NavigationLink(destination: MyWebView(urlToLoad: "https://github.com/garlicvread").navigationTitle("Raymond")) {
                        Text("Raymond")
                    }
                    
                    NavigationLink(destination: MyWebView(urlToLoad: "https://github.com/RuyHa").navigationTitle("Ruyha")) {
                        HStack{
                            Image("Ruyha")
                            Text("Ruyha")
                        }
                    }
                    
                    NavigationLink(destination: MyWebView(urlToLoad: "https://github.com/seodam-hst").navigationTitle("SeoDam")) {
                        Text("SeoDam")
                    }
                    
                    NavigationLink(destination: MyWebView(urlToLoad: "https://github.com/yeniful").navigationTitle("Yeni")) {
                        HStack{
                            Image("Yeni")
                            Text("Yeni")
                        }
                    }
                }
                
            }
            .navigationTitle("설정")
            .navigationBarTitleDisplayMode(.large)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading){
                    buttonToBack
                }
                
            })
            LicenseView()
        }
    }
    
    // Button View
    var buttonToBack : some View {
        Button(action: {
            isShowingSettingView.toggle()
        }, label: {
            Text("돌아가기")
        })
    }
    
}
