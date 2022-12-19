//
//  TwitterCloneApp.swift
//  TwitterClone
//
//  Created by Aliaksei Mikhailouski on 18/12/2022.
//

import SwiftUI

@main
struct TwitterCloneApp: App {
    @StateObject private var fetcher = TweetsFetcher()
    
    var body: some Scene {
        WindowGroup {
            TweetFeed(userDisplayName: "Developer", userNickName: "dev", following: "3K", followers: "101")
                .environmentObject(fetcher)
        }
    }
}
