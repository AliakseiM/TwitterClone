//
//  TweetsFetcher.swift
//  TwitterClone
//
//  Created by Aliaksei Mikhailouski on 18/12/2022.
//

import SwiftUI

class TweetsFetcher: ObservableObject {
    @Published var tweets = [Tweet]()

    let urlString = "http://192.168.202.172:8080/tweets"
    
    enum FetchError: Error {
            case badRequest
            case badJSON
        }
    
    func fetchData() async
    throws  {
       guard let url = URL(string: urlString) else { return }

       let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
       guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw FetchError.badRequest }

       Task { @MainActor in
           do {
               tweets = try JSONDecoder().decode([Tweet].self, from: data)
               print(tweets)
           } catch {
               print(error)
           }
       }
   }
}
