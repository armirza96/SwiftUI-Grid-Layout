//
//  RunKeeperTestApp.swift
//  Shared
//
//  Created by abdul on 2021-01-11.
//

import SwiftUI

@main
struct RunKeeperTestApp: App {
   // @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    init() {
        setupTheme()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    private func setupTheme() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().backgroundColor = UIColor.init(red: 99 / 255, green: 198 / 255, blue: 212 / 255, alpha: 1.0)
    }
}

//class AppDelegate: UIResponder, UIApplicationDelegate {
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        UINavigationBar.appearance().backgroundColor =
//        return true
//    }
//}
