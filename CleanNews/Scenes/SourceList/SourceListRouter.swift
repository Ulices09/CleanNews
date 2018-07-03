//
//  SourceListRouter.swift
//  CleanNews
//
//  Created by Ulices Meléndez on 24/06/18.
//  Copyright © 2018 Ulices Meléndez Acosta. All rights reserved.
//

import Foundation

protocol SourceListRoutingProtocol: class {
    func navigateToArticleList(sourceId: String)
}

class SourceListRouter: SourceListRoutingProtocol {
    
    weak var viewController: SourceListVC?
    
    func navigateToArticleList(sourceId: String) {
        
    }
}
