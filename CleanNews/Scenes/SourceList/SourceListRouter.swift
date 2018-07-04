//
//  SourceListRouter.swift
//  CleanNews
//
//  Created by Ulices Meléndez on 24/06/18.
//  Copyright © 2018 Ulices Meléndez Acosta. All rights reserved.
//

import Foundation

protocol SourceListRoutingLogic: class {
    func navigateToArticleList(source: Source)
}

class SourceListRouter: SourceListRoutingLogic {
    
    weak var viewController: SourceListVC?
    
    func navigateToArticleList(source: Source) {
        let articleSourceListVC = ArticleSourceListVC()
        articleSourceListVC.sourceId = source.id
        articleSourceListVC.sourceName = source.name
        viewController?.navigationController?.pushViewController(articleSourceListVC, animated: true)
    }
}
