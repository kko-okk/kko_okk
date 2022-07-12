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
                NavigationLink(destination: MyWebView(urlToLoad: "https://github.com/yeniful/kko_okk/blob/main/lisence.md").navigationTitle("License".localized)) {
                    Label("License".localized, systemImage: "doc.on.clipboard.fill")
                }
                
//                NavigationLink {
//                    LicenseView()
//                } label : {
//                    Label("라이센스", systemImage: "star.fill")
//                }
//
                NavigationLink(destination: MyWebView(urlToLoad: "https://github.com/yeniful/kko_okk").navigationTitle("GitHub")) {
                    HStack{
                        Image("GitHub")
                        Text("GitHub")
                    }
                }
//                ppapMailView
                
                NavigationLink {
                    ReportMailView()
                } label : {
                    Label("BugReport".localized, systemImage: "ladybug.fill")
                }
                
                
                Section(header: Text("Developer information".localized)){
                    NavigationLink(destination: MyWebView(urlToLoad: "https://github.com/Valentino1994").navigationTitle("Guell")) {
                        HStack{
                            Image("Guell")
                            Text("Guell")
                        }
                    }
                    NavigationLink(destination: MyWebView(urlToLoad: "https://github.com/LeeSungNo-ian").navigationTitle("Ian")) {
                        HStack{
                            Image("Ian")
                            Text("Ian")
                        }
                    }
                    
                    NavigationLink(destination: MyWebView(urlToLoad: "https://github.com/garlicvread").navigationTitle("Raymond")) {
                        HStack{
                            Image("Raymond")
                            Text("Raymond")
                        }
                    }
                    
                    NavigationLink(destination: MyWebView(urlToLoad: "https://github.com/RuyHa").navigationTitle("Ruyha")) {
                        HStack{
                            Image("Ruyha")
                            Text("Ruyha")
                        }
                    }
                    
                    NavigationLink(destination: MyWebView(urlToLoad: "https://github.com/seodam-hst").navigationTitle("SeoDam")) {
                        HStack{
                            Image("SeoDam")
                            Text("SeoDam")
                        }
                    }
                    
                    NavigationLink(destination: MyWebView(urlToLoad: "https://github.com/yeniful").navigationTitle("Yeni")) {
                        HStack{
                            Image("Yeni")
                            Text("Yeni")
                        }
                    }
                }
                
            }
            .navigationTitle("Setting".localized)
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
            Text("Back".localized)
        })
    }
    
}
