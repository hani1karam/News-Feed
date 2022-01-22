//
//  AppDelegate.swift
//  VIPER
//
//  Created by hany karam on 1/21/22.
//

import UIKit
import Alamofire

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let userManager = UserManager.sharedInstance

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window?.rootViewController = UINavigationController(rootViewController: FeedsRouter.createModule())
        networkConnection()
        return true
    }
    func networkConnection(){
        let manager = NetworkReachabilityManager(host: "www.google.com")
        manager?.startListening(onUpdatePerforming: { (status) in
            switch status {
            
            case .unknown:
                break
            case .notReachable:
                // Go to NoNetworkView Save and Cancel All Tasks
                AF.session.getAllTasks { (tasks) in
                    self.userManager.sessionTasks = tasks
                    tasks.forEach({$0.cancel()})
                }
                guard let controller = currentStoryboard(.NoNetwork).instantiateInitialViewController() as? NoNetworkViewController else {return}
                guard let window = UIApplication.shared.keyWindow else {return}
                //
                if getTopViewController() is NoNetworkViewController {return}
                if let indicator = window.subviews.last as? UIActivityIndicatorView {
                    indicator.removeFromSuperview()
                    if let container = window.subviews.last {
                        container.removeFromSuperview()
                        if let fullView = window.subviews.last {
                            fullView.removeFromSuperview()
                        }
                    }
                }
                controller.modalPresentationStyle = .overFullScreen
                controller.modalTransitionStyle = .coverVertical
                window.rootViewController?.present(controller, animated: true, completion: nil)
            @unknown default:
                break
            }
            print("Network Status Changed: \(status)")
            print("network reachable \(manager!.isReachable)")
        })
    }
    
}

