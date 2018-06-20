//
//  AppTabBarController.swift
//  CleanNews
//
//  Created by Ulices Meléndez on 19/06/18.
//  Copyright © 2018 Ulices Meléndez Acosta. All rights reserved.
//

import UIKit
import FontAwesome_swift

class AppTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        
        tabBar.tintColor = UIColor.primaryColor
        tabBar.unselectedItemTintColor = UIColor.lightGray
        
        let iconSize = 35
        
        let headlineListVC = HeadlineListVC()
        let sourceListVC = SourceListVC()
        let searchListVC = SearchListVC()
        let bookmarkListVC = BookmarkListVC()
        
        let headlineListUIImage = UIImage.fontAwesomeIcon(name: .fire, textColor: UIColor.primaryColor, size: CGSize(width: iconSize, height: iconSize))
        headlineListVC.tabBarItem = UITabBarItem(title: "Headlines", image: headlineListUIImage, tag: 0)
        
        let sourceListUIImage = UIImage.fontAwesomeIcon(name: .newspaperO, textColor: UIColor.primaryColor, size: CGSize(width: iconSize, height: iconSize))
        sourceListVC.tabBarItem = UITabBarItem(title: "Sources", image: sourceListUIImage, tag: 1)
        
        searchListVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 2)
        
        let bookmarkListUIImage = UIImage.fontAwesomeIcon(name: .bookmark, textColor: UIColor.primaryColor, size: CGSize(width: iconSize, height: iconSize))
        bookmarkListVC.tabBarItem = UITabBarItem(title: "Bookmarks", image: bookmarkListUIImage, tag: 3)
        
        let viewControllerList = [headlineListVC, sourceListVC, searchListVC, bookmarkListVC]
        
        //viewControllers = viewControllerList.map { UINavigationController(rootViewController: $0) }
        viewControllers = viewControllerList
    }

}
