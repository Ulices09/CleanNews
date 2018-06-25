//
//  SourceListInteractor.swift
//  CleanNews
//
//  Created by Ulices Meléndez on 24/06/18.
//  Copyright © 2018 Ulices Meléndez Acosta. All rights reserved.
//

import Foundation

protocol SourceListBusinessLogic: class {
    func fetchSources()
}

class SourceListInteractor: SourceListBusinessLogic {
    
    var serviceWorker: SourceServiceProtocol!
    var presenter: SourceListPresentationLogic!
    
    func fetchSources() {
        serviceWorker.fetchSources { (sources, error) in
            if let sources = sources {
                self.presenter.presentSources(sources)
            } else if let error = error {
                self.presenter.presentError(error)
            }
        }
    }
}


