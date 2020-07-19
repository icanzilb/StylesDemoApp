//
//  PillButtonAppApp.swift
//  PillButtonApp
//
//  Created by Mariin on 13.07.20.
//

import SwiftUI

@main
struct StyleDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(StyleManager())
        }
        .windowStyle(HiddenTitleBarWindowStyle())
        .windowToolbarStyle(UnifiedCompactWindowToolbarStyle())
    }
}
