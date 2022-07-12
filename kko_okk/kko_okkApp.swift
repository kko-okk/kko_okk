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
    @AppStorage("_isFirstLaunching") var isFirstLaunching: Bool = true
    @StateObject var pickedDate = PickedDate()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(pickedDate)
                .fullScreenCover(isPresented: $isFirstLaunching) {
                    OnBoardingTabView(selectedTag: 0, isFirstLaunching: $isFirstLaunching)
                }
        }
    }
    
}

