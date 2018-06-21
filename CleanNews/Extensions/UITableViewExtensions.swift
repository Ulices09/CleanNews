//
//  UITableViewExtentions.swift
//  CleanNews
//
//  Created by Ulices Meléndez on 21/06/18.
//  Copyright © 2018 Ulices Meléndez Acosta. All rights reserved.
//

import UIKit

//MARK:- FooterView
extension UITableView {
    
    func setupEmptyFooterView() {
        tableFooterView = UIView(frame: .zero)
        hideFooterView()
    }
    
    func setupLoadingFooterView() {
        tableFooterView = createLoadingView()
        hideFooterView()
    }
    
    func showFooterView() {
        tableFooterView?.isHidden = false
    }
    
    func hideFooterView() {
        tableFooterView?.isHidden = true
    }
    
    private func createLoadingView() -> UIView{
        let loadingView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: 50))
        let indicator = UIActivityIndicatorView()
        
        indicator.color = UIColor.primaryColor
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()
        loadingView.addSubview(indicator)
        
        indicator.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor).isActive = true
        
        return loadingView
    }
}
