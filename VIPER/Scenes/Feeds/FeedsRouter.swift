//
//  FeedsRouter.swift
//  VIPER
//
//  Created by hany karam on 1/21/22.
//

import UIKit
class FeedsRouter:FeedsRouterProtocol{
    weak var viewController: UIViewController?
    static func createModule()->UIViewController{
        let view = UIStoryboard(name: storyboards.Main.rawValue, bundle: nil).instantiateViewController(withIdentifier: "FeedsVC") as! ViewController
        let interactor = FeedsInteractor()
        let router = FeedsRouter()
        let presenter = FeedsPresnter(viewFeeds: view, interactor: interactor, router: router)
        view.presnter = presenter
        interactor.presnter = presenter
        router.viewController = view
        return view
        
    }
}
