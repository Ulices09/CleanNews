//
//  ArticleSourceListVC.swift
//  CleanNews
//
//  Created by Ulices Meléndez on 2/07/18.
//  Copyright © 2018 Ulices Meléndez Acosta. All rights reserved.
//

import UIKit

protocol ArticleSourceListDisplayLogic: class {
    func displayArticles(_ articles: [Article], total: Int)
    func displayErrorMessage(_ errorMessage: String)
    func displayLoading()
    func hideLoading()
}

class ArticleSourceListVC: UIViewController {
    
    var interactor: ArticleSourceListBusinessLogic!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        let viewController = self
        let interactor = ArticleSourceListInteractor()
        let presenter = ArticleSourceListPresenter()
        let serviceWorker = ArticleService()
        //let router = ArticleSourceListRouter()
        
        viewController.interactor = interactor
        interactor.serviceWorker = serviceWorker
        interactor.presenter = presenter
        presenter.viewController = viewController
        //viewController.router = router
        //router.viewController = viewController
    }

}

extension ArticleSourceListVC: ArticleSourceListDisplayLogic {
    func displayArticles(_ articles: [Article], total: Int) {
        
    }
    
    func displayErrorMessage(_ errorMessage: String) {
        
    }
    
    func displayLoading() {
        
    }
    
    func hideLoading() {
        
    }
}








