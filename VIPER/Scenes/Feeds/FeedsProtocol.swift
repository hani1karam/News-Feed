//
//  FeedsProtocol.swift
//  VIPER
//
//  Created by hany karam on 1/21/22.
//

import Foundation
protocol FeedsViewProtocol:class {
    var presnter:FeedsPresnterProtocol? {get set}
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func reloadData()
}
protocol FeedsPresnterProtocol:class {
    var viewFeeds:FeedsViewProtocol? {get set}
    func viewDidLoad()
    var numberofRow:Int {get}
    func configure(cell:FeedsTableViewCell,indexPath:IndexPath)
}
protocol FeedsRouterProtocol {
    
}
protocol FeedsInteractorInputPresnter {
    var presnter:FeedsInteractorOutputPresnter? {get set}
    func getFeeds()
}
protocol FeedsInteractorOutputPresnter:class {
    func feedsFetchedSuccessfully(user:[Article])
    func feedsFetchingFailed(withError error:Error)
    
}
