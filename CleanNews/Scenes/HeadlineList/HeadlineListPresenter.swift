//
//  HeadlineListPresenter.swift
//  CleanNews
//
//  Created by Ulices Meléndez on 13/06/18.
//  Copyright © 2018 Ulices Meléndez Acosta. All rights reserved.
//

import Foundation

protocol HeadlineListPresentationLogic: class {
    func presentTopHeadlines(_ articles: [Article], total: Int)
    func presentError(_ error: NSError)
}

class HeadlineListPresenter: HeadlineListPresentationLogic {
    
    weak var viewController: HeadlineListDisplayLogic!
    
    func presentTopHeadlines(_ articles: [Article], total: Int) {
        self.viewController.displayTopHeadlines(articles, total: total)
    }
    
    func presentError(_ error: NSError) {
        self.viewController.displayErrorMessage("Service Error")
    }
}
