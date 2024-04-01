//
//  AppDelegate.swift
//  PBnP
//
//  Created by Adam Kabak on 4/1/24.
//

import Foundation
import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }

    // Rest of the AppDelegate code...
}
