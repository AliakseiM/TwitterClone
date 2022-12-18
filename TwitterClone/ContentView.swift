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
        VStack {
            List(fetcher.tweets) { tweet in
                VStack {
                    Text(tweet.message)
                    Text("UserID: \(tweet.userID)")
                }
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
}

struct TweetFeed_Previews: PreviewProvider {
    static var previews: some View {
        TweetFeed()
    }
}
