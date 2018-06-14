//
//  ViewController.swift
//  CleanNews
//
//  Created by Ulices Meléndez on 12/06/18.
//  Copyright © 2018 Ulices Meléndez Acosta. All rights reserved.
//

import UIKit

protocol HeadlineListDisplayLogic: class {
    func displayTopHeadlines(_ articles: [Article], total: Int)
    func displayErrorMessage(_ errorMessage: String)
}

class HeadlineListVC: UIViewController, HeadlineListDisplayLogic {

    var interactor: HeadlineListBusinessLogic!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.fetchTopHeadlines(category: "business", page: 1)
    }
    
    private func setup() {
        let viewController = self
        let interactor = HeadlineListInteractor()
        let presenter = HeadlineListPresenter()
        let networkWorker = ArticleNetwork()
        
        viewController.interactor = interactor
        interactor.networkWorker = networkWorker
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    func displayTopHeadlines(_ articles: [Article], total: Int) {
        print(articles)
    }
    
    func displayErrorMessage(_ errorMessage: String) {
        print(errorMessage)
    }
    
    
}

