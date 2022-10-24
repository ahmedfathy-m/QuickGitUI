//
//  QuickGitUIApp.swift
//  QuickGitUI
//
//  Created by Ahmed Fathy on 24/10/2022.
//

import SwiftUI

@main
struct QuickGitUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
