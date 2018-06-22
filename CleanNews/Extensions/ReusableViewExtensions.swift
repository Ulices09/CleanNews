//
//  ReusableViewExtensions.swift
//  CleanNews
//
//  Created by Ulices Meléndez on 21/06/18.
//  Copyright © 2018 Ulices Meléndez Acosta. All rights reserved.
//

import UIKit

protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self)
    }
}

extension UICollectionViewCell: ReusableView {}

extension UITableViewCell: ReusableView {}
