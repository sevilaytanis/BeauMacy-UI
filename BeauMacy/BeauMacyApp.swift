//
//  FastPizzaApp.swift
//  FastPizza
//
//  Created by Alex Karamanets on 14.01.2023.
//

import SwiftUI
import Firebase
import FirebaseAuth

@main
struct BeauMacyApp: App {
    
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            
            MainTabBarView()
            
            /*
           if let user = AuthService.shared.currentUser {
               let viewModel = MainTabBarViewModel(user: user)
               MainTabBarView(viewModel: viewModel)
             
            } else {
             
               // AuthView()
            }*/
        }
    }
    class AppDelegate: NSObject, UIApplicationDelegate {
      func application(_ application: UIApplication,
                       didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
      }
    }
}
