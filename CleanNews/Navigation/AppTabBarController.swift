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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setupView()
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
        //headlineListVC.tabBarItem = UITabBarItem(title: "Headlines", image: headlineListUIImage, tag: 0)
        addTabBarItem(viewController: headlineListVC, title: "Headlines", image: headlineListUIImage, tag: 0)
        
        let sourceListUIImage = UIImage.fontAwesomeIcon(name: .newspaperO, textColor: UIColor.primaryColor, size: CGSize(width: iconSize, height: iconSize))
        //sourceListVC.tabBarItem = UITabBarItem(title: "Sources", image: sourceListUIImage, tag: 1)
        addTabBarItem(viewController: sourceListVC, title: "Sources", image: sourceListUIImage, tag: 1)
        
        //searchListVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 2)
        addTabBarItem(viewController: searchListVC, tabBarSystemItem: .search, tag: 2)
        
        let bookmarkListUIImage = UIImage.fontAwesomeIcon(name: .bookmark, textColor: UIColor.primaryColor, size: CGSize(width: iconSize, height: iconSize))
        //bookmarkListVC.tabBarItem = UITabBarItem(title: "Bookmarks", image: bookmarkListUIImage, tag: 3)
        addTabBarItem(viewController: bookmarkListVC, title: "Bookmarks", image: bookmarkListUIImage, tag: 3)
        
        //let viewControllerList = [headlineListVC, sourceListVC, searchListVC, bookmarkListVC]
        //viewControllers = viewControllerList.map { UINavigationController(rootViewController: $0) }
        //viewControllers = viewControllerList
    }
    
    private func addTabBarItem(viewController: UIViewController, title: String, image: UIImage, tag: Int) {
        let navigationController = UINavigationController(rootViewController: viewController)
        addChildViewController(navigationController)
        navigationController.tabBarItem = UITabBarItem(title: title, image: image, tag: tag)
    }
    
    private func addTabBarItem(viewController: UIViewController, tabBarSystemItem: UITabBarSystemItem, tag: Int) {
        let navigationController = UINavigationController(rootViewController: viewController)
        addChildViewController(navigationController)
        navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: tabBarSystemItem, tag: tag)
    }

}

























