//
//  Smart_position_systemApp.swift
//  Smart_position_system
//
//  Created by Holung Cheng on 28/12/2023.
//

import SwiftUI

import Firebase
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct RoomPlan_2DApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
                //WelcomeView()
                ContentView()
            
        }
    }
}
