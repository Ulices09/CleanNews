//
//  ViewController.swift
//  CleanNews
//
//  Created by Ulices Meléndez on 12/06/18.
//  Copyright © 2018 Ulices Meléndez Acosta. All rights reserved.
//

import UIKit
import Lottie
//#6DD88A

protocol HeadlineListDisplayLogic: class {
    func displayTopHeadlines(_ articles: [Article], total: Int)
    func displayErrorMessage(_ errorMessage: String)
    func displayLoading()
    func hideLoading()
}

class HeadlineListVC: UIViewController, HeadlineListDisplayLogic {

    var interactor: HeadlineListBusinessLogic!
    
    @IBOutlet weak var articlesTable: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.fetchTopHeadlines(category: "business", page: 1)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
    
    private func setupView() {
        //articlesTable = UITableView(frame: CGRect()
    }
    
    func displayTopHeadlines(_ articles: [Article], total: Int) {
        print(articles)
        self.hideLoading()
    }
    
    func displayErrorMessage(_ errorMessage: String) {
        print(errorMessage)
    }
    
    func displayLoading() {
        let loadingView = ViewHelper.getLoadingView(parentView: self.view)
        self.view.addSubview(loadingView)
        
    }
    
    func hideLoading() {
        if let loadingView = self.view.viewWithTag(666) {
            loadingView.removeFromSuperview()
        }
    }
}

