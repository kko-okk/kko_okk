//
//  kko_okkApp.swift
//  kko_okk
//
//  Created by Kim, Che-Pill on 2022/05/31.
//

import SwiftUI

@main
struct kko_okkApp: App {
    let persistenceController = PersistenceController.shared
    @State var isFirstLaunching: Bool = false
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .fullScreenCover(isPresented: $isFirstLaunching) {
                    OnBoardingTabView(selectedTag: 0)
                }
        }
    }
}

