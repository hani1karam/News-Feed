//
//  FeedsInteractor.swift
//  VIPER
//
//  Created by hany karam on 1/21/22.
//

import Foundation
class FeedsInteractor:FeedsInteractorInputPresnter {
    weak var presnter: FeedsInteractorOutputPresnter?
    private let feedsWorker = FeedsWorker()
    func getFeeds() {
        feedsWorker.getFeeds{result in
            switch result{
            case .success(let feed):
                self.presnter?.feedsFetchedSuccessfully(user: feed.articles ?? [])
                print(feed)
            case .failure(let error):
                self.presnter?.feedsFetchingFailed(withError: error)
                print(error,error.localizedDescription)
            }
        }
    }
    
}
