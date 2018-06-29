//
//  UIViewControllerExtensions.swift
//  CleanNews
//
//  Created by Ulices Meléndez on 28/06/18.
//  Copyright © 2018 Ulices Meléndez Acosta. All rights reserved.
//

import UIKit
import Lottie

// MARK: LoadingView
extension UIViewController {
    func displayLoadingView(view: UIView) -> UIView {
        let animationView = UIView()
        
        animationView.frame.size.height = 110
        animationView.frame.size.width = 110
        animationView.center = view.center
        
        let loadingAnimation = LOTAnimationView(name: "Loading")
        loadingAnimation.loopAnimation = true
        loadingAnimation.animationSpeed = 1.8
        loadingAnimation.contentMode = .scaleAspectFit
        loadingAnimation.frame = animationView.bounds
        loadingAnimation.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        loadingAnimation.play()
        
        DispatchQueue.main.async {
            animationView.addSubview(loadingAnimation)
            view.addSubview(animationView)
        }
        return animationView
    }
    
    func removeLoadinView(loadingView: UIView) {
        DispatchQueue.main.async {
            loadingView.removeFromSuperview()
        }
    }
}
