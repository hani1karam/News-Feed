//
//  UserManager.swift
//  VIPER
//
//  Created by hany karam on 1/22/22.
//

import Foundation
import Alamofire
class UserManager {
    static var sharedInstance = UserManager()
    let defaults = UserDefaults.standard
    var sessionTasks = [URLSessionTask]()

}
