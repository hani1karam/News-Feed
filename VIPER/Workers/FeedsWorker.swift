//
//  FeedsWorker.swift
//  VIPER
//
//  Created by hany karam on 1/21/22.
//

import Foundation
class FeedsWorker{
    let placesRequest = SimpleGetRequest(url: "https://newsapi.org/v2/top-headlines?apiKey=f0b310a6e5f349838307ddd53bfa66c0&country=AR",parameters: nil, method: .get)
    func getFeeds(completionHandler: @escaping (Result<NewsModel>) -> ()) {
        APIClient.shared.sentRequest(request: placesRequest, mapResponseOnType: NewsModel.self, completionHandler: completionHandler)
        
    }
    
}
