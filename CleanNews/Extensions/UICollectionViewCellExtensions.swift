//
//  UICollectionViewCellExtensions.swift
//  CleanNews
//
//  Created by Ulices Meléndez on 28/06/18.
//  Copyright © 2018 Ulices Meléndez Acosta. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    func animateOnDisplay() {
        alpha = 0
        layer.transform = CATransform3DTranslate(CATransform3DIdentity, 0, 100, 0)
        UIView.animate(withDuration: 0.5) {
            self.alpha = 1
            self.layer.transform = CATransform3DIdentity
        }
    }
}

