//
//  ArticleSourceListPresenter.swift
//  CleanNews
//
//  Created by Ulices Meléndez on 2/07/18.
//  Copyright © 2018 Ulices Meléndez Acosta. All rights reserved.
//

import Foundation

protocol ArticleSourceListPresentationLogic: class {
    func presentArticles(_ articles: [Article], total: Int)
    func presentError(_ error: NSError)
    func presentLoading()
}

class ArticleSourceListPresenter: ArticleSourceListPresentationLogic {
    
    weak var viewController: ArticleSourceListDisplayLogic!
    
    func presentArticles(_ articles: [Article], total: Int) {
        self.viewController.hideLoading()
        self.viewController.displayArticles(articles, total: total)
    }
    
    func presentError(_ error: NSError) {
        self.viewController.displayErrorMessage("Service Error")
    }
    
    func presentLoading() {
        self.viewController.displayLoading()
    }
}
