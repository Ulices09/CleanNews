//
//  ArticleSourceListRouter.swift
//  CleanNews
//
//  Created by Ulices Meléndez on 2/07/18.
//  Copyright © 2018 Ulices Meléndez Acosta. All rights reserved.
//

import Foundation

protocol ArticleSourceListRoutingLogic: class {
    func navigateToArticleWebDetail(articleUrl: String)
}

class ArticleSourceListRouter: ArticleSourceListRoutingLogic {
    
    weak var viewController: ArticleSourceListVC?
    
    func navigateToArticleWebDetail(articleUrl: String) {
        let articleWebDetailVC = ArticleWebDetailVC()
        articleWebDetailVC.articleUrl = articleUrl
        viewController?.navigationController?.pushViewController(articleWebDetailVC, animated: true)
    }
}
