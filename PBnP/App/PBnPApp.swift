//
//  PBnPApp.swift
//  PBnP
//
//  Created by Adam Kabak on 4/1/24.
//

import SwiftUI

@main
struct PBnPApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
