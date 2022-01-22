//
//  UIWindowExtenstion.swift
//  VIPER
//
//  Created by hany karam on 1/22/22.
//

import UIKit
public extension UIWindow {
    public var visibleViewController: UIViewController? {
        return UIWindow.getVisibleViewControllerFrom(self.rootViewController)
    }

    public static func getVisibleViewControllerFrom(_ vc: UIViewController?) -> UIViewController? {
        if let nc = vc as? UINavigationController {
            return UIWindow.getVisibleViewControllerFrom(nc.visibleViewController)
        } else if let tc = vc as? UITabBarController {
            return UIWindow.getVisibleViewControllerFrom(tc.selectedViewController)
        } else {
            if let pvc = vc?.presentedViewController {
                return UIWindow.getVisibleViewControllerFrom(pvc)
            } else {
                return vc
            }
        }
    }
}
func getTopViewController() -> UIViewController? {
   let appDelegate = UIApplication.shared.delegate
   if let window = appDelegate!.window {
       return window?.visibleViewController
   }
   return nil
}

