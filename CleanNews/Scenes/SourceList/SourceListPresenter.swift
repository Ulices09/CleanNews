//
//  SourceListPresenter.swift
//  CleanNews
//
//  Created by Ulices Meléndez on 24/06/18.
//  Copyright © 2018 Ulices Meléndez Acosta. All rights reserved.
//

import Foundation

protocol SourceListPresentationLogic: class {
    func presentSources(_ sources: [Source])
    func presentError(_ error: NSError)
    func presentLoading()
}

class SourceListPresenter: SourceListPresentationLogic {
    
    weak var viewController: SourceListDisplayLogic!
    
    func presentSources(_ sources: [Source]) {
        viewController.hideLoading()
        viewController.displaySources(sources)
    }
    
    func presentError(_ error: NSError) {
        viewController.displayErrorMessage("Error")
    }
    
    func presentLoading() {
        viewController.displayLoading()
    }
}




