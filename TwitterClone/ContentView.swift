//
//  ContentView.swift
//  TwitterClone
//
//  Created by Aliaksei Mikhailouski on 18/12/2022.
//

import SwiftUI

struct TweetFeed: View {
    @EnvironmentObject var fetcher: TweetsFetcher
    
    var body: some View {
        TabView {
            NavigationStack {
                VStack {
                    List(fetcher.tweets) { tweet in
                        TweetView(isRecommended: true, userDisplayName: "User User", isVerified: true, userNickName: "lol_kek", howLongAgo: "2h", message: tweet.message, commentsCount: "123", retweetsCount: "123", likesCount: "123")
                            .listRowBackground(Color.clear)
                    }
                    
                }
                .refreshable {
                    do {
                        try await fetcher.fetchData()
                        print("fetched tweets")
                    } catch {
                        print(error)
                    }
                }
                .task {
                    do {
                        try await fetcher.fetchData()
                        print("fetched tweets")
                    } catch {
                        print(error)
                    }
                }
            }
            .tabItem {
                Label("", systemImage: "house.fill")
            }
            
            NavigationStack {
            }
            .tabItem {
                Label("", systemImage: "magnifyingglass")
            }
            
            NavigationStack {
            }
            .tabItem {
                Label("", systemImage: "bell")
            }
            
            NavigationStack {
            }
            .tabItem {
                Label("", systemImage: "envelope")
            }
            
        }
    }
}

struct TweetFeed_Previews: PreviewProvider {
    static let fetcher = TweetsFetcher()
        
    static var previews: some View {
        TweetFeed()
            .environmentObject(fetcher)
    }
}
