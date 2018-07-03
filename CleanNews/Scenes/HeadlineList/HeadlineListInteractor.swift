//
//  HeadlinesInteractor.swift
//  CleanNews
//
//  Created by Ulices Meléndez on 13/06/18.
//  Copyright © 2018 Ulices Meléndez Acosta. All rights reserved.
//

import Foundation

protocol HeadlineListBusinessLogic: class {
    func fetchTopHeadlines(category: String, page: NSInteger, isRefreshing: Bool)
}

class HeadlineListInteractor: HeadlineListBusinessLogic {
    
    var serviceWorker: HeadlineServiceProtocol!
    var presenter: HeadlineListPresentationLogic!
    
    func fetchTopHeadlines(category: String, page: NSInteger, isRefreshing: Bool) {
        
        if (page == 1 && !isRefreshing) { self.presenter.presentLoading() }
        
        serviceWorker.fetchTopHeadlinesByCategory(category: category, page: page) { (articles, total, error) in

            if let articles = articles {
                self.presenter.presentTopHeadlines(articles, total: total)
            } else if let error = error {
                self.presenter.presentError(error)
            }
        }
    }
}
