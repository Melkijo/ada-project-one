//
//  Academy_App_OneApp.swift
//  Academy App One
//
//  Created by Melki Jonathan Andara on 17/03/25.
//

import SwiftUI
import SwiftData
@main
struct Academy_App_OneApp: App {
    var body: some Scene {
        WindowGroup {
            SplashView()
        }
        .modelContainer(for:[HistoryBMI.self])
    }
}
