//
//  ContentView.swift
//  TwitterClone
//
//  Created by Aliaksei Mikhailouski on 18/12/2022.
//

import SwiftUI

struct TweetFeed: View {
    @EnvironmentObject var fetcher: TweetsFetcher
    
    @State private var showMenu = false
        
    var userDisplayName: String
    var userNickName: String
    var following: String
    var followers: String
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                NavigationStack {
                    VStack(alignment: .leading) {
                        HStack(alignment: .top) {
                            Button(action: {self.showMenu.toggle()}) {
                                Image("swift")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                            }
                            
                        }
                        Text(userDisplayName)
                        Text("@\(userNickName)")
                        HStack {
                            Text(following)
                            Text("following").foregroundColor(.gray)
                            Text("")
                            Text(followers)
                            Text("followers").foregroundColor(.gray)
                        }
                        Spacer()
                    }
                    
                }
                .frame(width: geometry.size.width*2/3)
//                .border(.gray)
                
                TabView {
                    NavigationStack {
                        VStack {
                            if fetcher.tweets.count == 0 {
                                Text("no data")
                            }
                            List(fetcher.tweets) { tweet in
                                TweetView(isRecommended: true, userDisplayName: "User User", isVerified: true, userNickName: "lol_kek", howLongAgo: "2h", message: tweet.message, commentsCount: "123", retweetsCount: "123", likesCount: "123")
                                    .listRowBackground(Color.clear)
                            }
                        }
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button(action: {self.showMenu.toggle()}) {
                                    Image("swift")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(minWidth: 30, maxWidth: 50, minHeight: 30, maxHeight: 50)
                                        .clipShape(Circle())
                                }
                                .opacity(showMenu ? 0.01 : 1)
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
                .background(Color.gray)
                .offset(x: showMenu ? geometry.size.width*2/3 : 0)
                .opacity(showMenu ? 0.5 : 1)
                .animation(.easeOut(duration: 0.3))
            }
        }
    }
}

struct TweetFeed_Previews: PreviewProvider {
    static let fetcher = TweetsFetcher()
        
    static var previews: some View {
        TweetFeed(userDisplayName: "Developer", userNickName: "dev", following: "3K", followers: "101")
            .environmentObject(fetcher)
    }
}
