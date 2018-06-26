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
        headlineFilterVC.modalPresentationStyle = .overCurrentContext
        //viewController?.navigationController?.pushViewController(headlineFilterVC, animated: true)
        viewController?.present(headlineFilterVC, animated: true, completion: nil)
    }
}
