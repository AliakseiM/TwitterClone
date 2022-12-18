//
//  Tweet.swift
//  TwitterClone
//
//  Created by Aliaksei Mikhailouski on 18/12/2022.
//

import SwiftUI

struct Tweet: Codable, Identifiable {
    var id: Int64 {
            return messageID
        }
    
    var messageID: Int64
    var message: String
    var userID: Int64
    
    static let noTweets = Tweet(messageID: 0, message: "You have no tweets", userID: 0)
    
    private enum CodingKeys: String, CodingKey {
        case messageID = "message_id"
        case message
        case userID = "user_id"
    }
}
