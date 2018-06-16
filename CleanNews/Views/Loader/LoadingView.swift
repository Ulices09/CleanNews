//
//  LoadingView.swift
//  CleanNews
//
//  Created by Ulices Meléndez on 16/06/18.
//  Copyright © 2018 Ulices Meléndez Acosta. All rights reserved.
//

import UIKit
import Lottie

 class ViewHelper {
    
    static func getLoadingView(parentView: UIView) -> UIView {
        let animationContainer = UIView()
        
        animationContainer.frame.size.height = 120
        animationContainer.frame.size.width = 120
        animationContainer.center = parentView.center
        animationContainer.tag = 666
        
        let loadingAnimation = LOTAnimationView(name: "Loading")
        loadingAnimation.loopAnimation = true
        loadingAnimation.animationSpeed = 1.8
        loadingAnimation.contentMode = .scaleAspectFit
        loadingAnimation.frame = animationContainer.bounds
        loadingAnimation.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        loadingAnimation.play()
        
        animationContainer.addSubview(loadingAnimation)
        return animationContainer
    }
}


