//
//  ArticleSourceListInteractor.swift
//  CleanNews
//
//  Created by Ulices Meléndez on 2/07/18.
//  Copyright © 2018 Ulices Meléndez Acosta. All rights reserved.
//

import Foundation

protocol ArticleSourceListBusinessLogic: class {
    func fetchArticles(sourceId: String, page: NSInteger, showLoadingView: Bool)
}

class ArticleSourceListInteractor: ArticleSourceListBusinessLogic {
    
    var serviceWorker: HeadlineServiceProtocol!
    var presenter: ArticleSourceListPresentationLogic!
    
    func fetchArticles(sourceId: String, page: NSInteger, showLoadingView: Bool) {
        
        if (page == 1 && showLoadingView) { self.presenter.presentLoading() }
        
        serviceWorker.fetchTopHeadlinesBySource(sourceId: sourceId, page: page) { (articles, total, error) in
            
            if let articles = articles {
                self.presenter.presentArticles(articles, total: total)
            } else if let error = error {
                self.presenter.presentError(error)
            }
        }
    }
}
