//
//  AppTabBarController.swift
//  CleanNews
//
//  Created by Ulices Meléndez on 19/06/18.
//  Copyright © 2018 Ulices Meléndez Acosta. All rights reserved.
//

import UIKit

class AppTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        let headlineListVC = HeadlineListVC()
        let searchListVC = SearchListVC()
        
        headlineListVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        searchListVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        
        let tabBarList = [headlineListVC, searchListVC]
        
        viewControllers = tabBarList
    }

}
