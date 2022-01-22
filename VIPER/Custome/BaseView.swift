//
//  BaseView.swift
//  VIPER
//
//  Created by hany karam on 1/22/22.
//

import UIKit

class BaseView:UIViewController{
    let screenBounds = UIScreen.main.bounds
    lazy var fullView = UIView(frame: CGRect(x: 0, y: 0, width: screenBounds.width, height: screenBounds.height))
    lazy var indicatorContainerView = UIView(frame: CGRect(x: self.fullView.frame.size.width / 2, y: self.fullView.frame.size.height / 2, width: 80, height: 80))
    lazy var indicator = UIActivityIndicatorView(frame: CGRect(x: self.indicatorContainerView.frame.size.width / 2, y: self.indicatorContainerView.frame.size.height / 2, width: 100, height: 100))
    let mainColor = hexStringToUIColor(hex: "000000")

    func drawIndicatorView() {
        fullView.backgroundColor = .black
        fullView.alpha = 0.7
        indicatorContainerView.backgroundColor = .white
        indicatorContainerView.alpha = 0.8
        indicatorContainerView.layer.cornerRadius = 12
        
        if #available(iOS 13.0, *) {
            indicator.style = .large
        } else {
            // Fallback on earlier versions
            indicator.style = .whiteLarge
        }
        indicator.color = mainColor
        indicator.startAnimating()
        guard let window = UIApplication.shared.keyWindow else {return}
        window.addSubview(fullView)
        window.addSubview(indicatorContainerView)
        window.addSubview(indicator)
        window.bringSubviewToFront(fullView)
        window.bringSubviewToFront(indicatorContainerView)
        window.bringSubviewToFront(indicator)
        indicatorContainerView.center = fullView.center
        indicator.center = indicatorContainerView.center
        
    }
    func startLoading() {
        drawIndicatorView()
        fullView.isHidden = false
        indicatorContainerView.isHidden = false
        indicator.isHidden = false
    }
    
    func endLoading() {
        DispatchQueue.main.async {
            self.fullView.isHidden = true
            self.indicatorContainerView.isHidden = true
            self.indicator.isHidden = true
            self.fullView.removeFromSuperview()
            self.indicator.removeFromSuperview()
            self.indicatorContainerView.removeFromSuperview()
        }
    }
    
}
