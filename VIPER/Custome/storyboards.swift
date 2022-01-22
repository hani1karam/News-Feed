//
//  storyboards.swift
//  VIPER
//
//  Created by hany karam on 1/22/22.
//

import UIKit

enum storyboards: String {
    case Splash = "Splash"
    case Main = "Main"
    case NoNetwork

}
func currentStoryboard(_ storyboard: storyboards) -> UIStoryboard {
    return UIStoryboard(name: storyboard.rawValue, bundle: nil)
}
