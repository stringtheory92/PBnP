//
//  PBnPApp.swift
//  PBnP
//
//  Created by Adam Kabak on 4/1/24.
//
// email: verticalvision@gmail.com
// password: password

import SwiftUI
import Firebase

@main
struct PBnPApp: App {
    let persistenceController = PersistenceController.shared // for CoreData. Might be able to delete
    @StateObject var viewModel = AuthViewModel()

    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext) // for CoreData. Might be able to delete
                .environmentObject(viewModel)
        }
    }
}
