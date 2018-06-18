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
    var articles: [Article] = []
    var currentPage = 1
    var totalArticles = 0
    var currentCategory = "business"
    
    @IBOutlet weak var articlesTable: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        interactor.fetchTopHeadlines(category: currentCategory, page: currentPage)
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
    
    private func setupTableView() {
        articlesTable.delegate = self
        articlesTable.dataSource = self
    }
    
    func displayTopHeadlines(_ articles: [Article], total: Int) {
        self.articles.append(contentsOf: articles)
        self.totalArticles = total
        
        self.articlesTable.reloadData()
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

extension HeadlineListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let article = articles[indexPath.row]
        return UITableViewCell()
    }
    
    
}
































