//
//  HeadlineListRouter.swift
//  CleanNews
//
//  Created by Ulices Meléndez on 23/06/18.
//  Copyright © 2018 Ulices Meléndez Acosta. All rights reserved.
//

import UIKit

protocol HeadlineListRoutingLogic: class {
    func navigateToArticleWebDetail(articleUrl: String)
    func navigateToHeadlineFilter()
}

class HeadlineListRouter: HeadlineListRoutingLogic {
    
    weak var viewController: HeadlineListVC?
    
    func navigateToArticleWebDetail(articleUrl: String) {
        let articleWebDetailVC = ArticleWebDetailVC()
        articleWebDetailVC.articleUrl = articleUrl
        viewController?.navigationController?.pushViewController(articleWebDetailVC, animated: true)
    }
    
    func navigateToHeadlineFilter() {
        let headlineFilterVC = HeadlineFilterVC()
        headlineFilterVC.headlineListDelegate = viewController
        headlineFilterVC.currentCategory = viewController?.currentCategory
        
        let navigationController = UINavigationController(rootViewController: headlineFilterVC)
        navigationController.modalPresentationStyle = .overCurrentContext
        
        viewController?.present(navigationController, animated: true, completion: nil)
    }
}
