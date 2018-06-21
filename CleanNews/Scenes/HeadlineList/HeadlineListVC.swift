//
//  ViewController.swift
//  CleanNews
//
//  Created by Ulices Meléndez on 12/06/18.
//  Copyright © 2018 Ulices Meléndez Acosta. All rights reserved.
//

import UIKit
import Lottie

// TODO: Create extension for reuse identifiers
let cellRI = "ArticleCell"

protocol HeadlineListDisplayLogic: class {
    func displayTopHeadlines(_ articles: [Article], total: Int)
    func displayErrorMessage(_ errorMessage: String)
    func displayLoading()
    func hideLoading()
}

class HeadlineListVC: UIViewController {

    var interactor: HeadlineListBusinessLogic!
    
    var articles: [Article] = []
    var currentPage = 1
    var totalArticles = 0
    var currentCategory = "business"
    
    var articlesTable: UITableView = UITableView()
    
    lazy var tableRefreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(HeadlineListVC.refreshTopHeadlines(_:)), for: .valueChanged)
        refreshControl.tintColor = UIColor.primaryColor
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupViews()
        interactor.fetchTopHeadlines(category: currentCategory, page: currentPage, isRefreshing: false)
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
    
    private func setupViews() {
        title = "Headlines"
        view.addSubview(articlesTable)
        
        articlesTable.translatesAutoresizingMaskIntoConstraints = false
        articlesTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        articlesTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        articlesTable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        articlesTable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        articlesTable.tableFooterView = UIView(frame: .zero)
        articlesTable.refreshControl = tableRefreshControl
        
        articlesTable.delegate = self
        articlesTable.dataSource = self
        
        articlesTable.estimatedRowHeight = 44
        articlesTable.rowHeight = UITableViewAutomaticDimension
        
        articlesTable.register(ArticleCell.self, forCellReuseIdentifier: cellRI)
        
    }
    
    @objc func refreshTopHeadlines(_ sender: Any) {
        currentPage = 1
        interactor.fetchTopHeadlines(category: currentCategory, page: currentPage, isRefreshing: true)
    }
}

extension HeadlineListVC: HeadlineListDisplayLogic {
    
    func displayTopHeadlines(_ articles: [Article], total: Int) {
        if(currentPage == 1) { self.articles = [] }
        
        self.articles.append(contentsOf: articles)
        self.totalArticles = total
        
        tableRefreshControl.endRefreshing()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellRI, for: indexPath) as! ArticleCell
        cell.setupData(article: article)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
































