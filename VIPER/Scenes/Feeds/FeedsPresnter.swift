//
//  FeedsPresnter.swift
//  VIPER
//
//  Created by hany karam on 1/21/22.
//

import Foundation
class FeedsPresnter:FeedsPresnterProtocol,FeedsInteractorOutputPresnter {
    weak var viewFeeds: FeedsViewProtocol?
    private let interactor:FeedsInteractorInputPresnter
    private let router:FeedsRouterProtocol
    private var feeds = [Article]()
    init(viewFeeds:FeedsViewProtocol,interactor:FeedsInteractorInputPresnter,router:FeedsRouterProtocol) {
        self.interactor = interactor
        self.router = router
        self.viewFeeds = viewFeeds
    }
    func viewDidLoad() {
        viewFeeds?.showLoadingIndicator()
        interactor.getFeeds()
    }
    func feedsFetchedSuccessfully(user: [Article]) {
        viewFeeds?.hideLoadingIndicator()
        self.feeds.append(contentsOf: user)
        viewFeeds?.reloadData()
        print(user)
    }
    
    func feedsFetchingFailed(withError error: Error) {
        viewFeeds?.hideLoadingIndicator()
        print(error,error.localizedDescription)
    }
    var numberofRow: Int{
        return feeds.count
    }
    func configure(cell: FeedsTableViewCell, indexPath: IndexPath) {
        let feedsData = feeds[indexPath.row]
        cell.configure(news: feedsData)
        
    }
    
}
