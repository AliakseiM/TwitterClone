//
//  TweetView.swift
//  TwitterClone
//
//  Created by Aliaksei Mikhailouski on 18/12/2022.
//

import SwiftUI

struct TweetView: View {
    var isRecommended: Bool
    var userDisplayName: String
    var isVerified: Bool
    var userNickName: String
    var howLongAgo: String
    var message: String
    var commentsCount: String
    var retweetsCount: String
    var likesCount: String
    
    var body: some View {
        
        VStack(alignment: .center) {
            if isRecommended {
                HStack(spacing: 5) {
                    // some gray text
                    VStack {
                        HStack {
                            Spacer()
                            Image(systemName: "person.fill")
                        }
                    }
                    .frame(minWidth: 30, maxWidth: 50)
                    
                    VStack {
                        HStack {
                            Text("Your friend follows")
                            Spacer()
                        }
                    }
                }
                .foregroundColor(.gray)
            }
            HStack(alignment: .top, spacing: 5) {
                // body
                VStack {
                    // profile photo
                    Image("elon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(minWidth: 30, maxWidth: 50, minHeight: 30, maxHeight: 50)
                        .clipShape(Circle())
                }
                .frame(minWidth: 30, maxWidth: 50)
                
                VStack(spacing: 10) {
                    HStack {
                        // name, verified mark, nick, how long ago, actions menu
                        Text(userDisplayName)
                            .bold()
                        
                        if isVerified {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.blue)
                        }
                        
                        Text("@\(userNickName) · \(howLongAgo).")
                            .foregroundColor(.gray)
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("···")
                                .foregroundColor(.gray)
                                .opacity(0.5)
                        }
                    }

                    HStack {
                        // main text
                        Text(message)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    HStack {
                        // ? image
                    }
                    
                    HStack(spacing: 10) {
                        // comments, retweets, likes, share
                        HStack {
                            Image(systemName: "message")
                            Text(commentsCount)
                        }
                        .bold()
                        Spacer()
                        HStack {
                            Image(systemName: "arrow.2.squarepath")
                            Text(retweetsCount)
                        }
                        .bold()
                        Spacer()
                        HStack {
                            Image(systemName: "heart")
                            Text(likesCount)
                        }
                        .bold()
                        Spacer()
                        HStack {
                            Image(systemName: "square.and.arrow.up")
                        }
                        .bold()
                        Spacer()
                    }
                    .foregroundColor(.gray)
                    
                }
            }
            
        }
        
    }
}

struct TweetView_Previews: PreviewProvider {
    static var previews: some View {
        TweetView(
            isRecommended: true,
            userDisplayName: "Jonh Doe",
            isVerified: true,
            userNickName: "JonhyDoey",
            howLongAgo: "2h",
            message: "Software engineering can be a challenging field, but it can also be extremely rewarding when you solve a tough problem or develop a new feature. It's all about finding creative solutions to complex issues and continuously learning and growing as a developer.",
            commentsCount: "52",
            retweetsCount: "24,3K",
            likesCount: "1093"
        )
            .previewLayout(.sizeThatFits)
    }
}
