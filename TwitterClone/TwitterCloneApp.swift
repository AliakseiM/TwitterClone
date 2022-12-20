//
//  TwitterCloneApp.swift
//  TwitterClone
//
//  Created by Aliaksei Mikhailouski on 18/12/2022.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct TwitterCloneApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject private var fetcher = TweetsFetcher()
    
    var body: some Scene {
        WindowGroup {
            RegistrationView()
//            TweetFeed(userDisplayName: "Developer", userNickName: "dev", following: "3K", followers: "101")
//                .environmentObject(fetcher)
        }
    }
}
