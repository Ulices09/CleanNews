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
    func displayLoading()
    func hideLoading()
}

class HeadlineListVC: UIViewController {

    var interactor: HeadlineListBusinessLogic!
    var router: HeadlineListRoutingLogic!
    
    var articles: [Article] = []
    var currentPage = 1
    var totalArticles = 0
    var currentCategory = "business"
    var loadingMore = false
    var showedCellIndexes: [IndexPath] = []
    
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
        let serviceWorker = ArticleService()
        let router = HeadlineListRouter()
        
        viewController.interactor = interactor
        interactor.serviceWorker = serviceWorker
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.router = router
        router.viewController = viewController
        
    }
    
    private func setupViews() {
        title = "Headlines"
        view.addSubview(articlesTable)
        
        articlesTable.translatesAutoresizingMaskIntoConstraints = false
        articlesTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        articlesTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        articlesTable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        articlesTable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        articlesTable.setupLoadingFooterView()
        articlesTable.refreshControl = tableRefreshControl
        
        articlesTable.delegate = self
        articlesTable.dataSource = self
        
        articlesTable.estimatedRowHeight = 44
        articlesTable.rowHeight = UITableViewAutomaticDimension
        
        articlesTable.register(ArticleCell.self, forCellReuseIdentifier: ArticleCell.defaultReuseIdentifier)
        
    }
    
    @objc func refreshTopHeadlines(_ sender: Any) {
        currentPage = 1
        interactor.fetchTopHeadlines(category: currentCategory, page: currentPage, isRefreshing: true)
    }
    
    private func loadMoreData() {
        currentPage += 1
        loadingMore = true
        interactor.fetchTopHeadlines(category: currentCategory, page: currentPage, isRefreshing: false)
    }
}

extension HeadlineListVC: HeadlineListDisplayLogic {
    
    func displayTopHeadlines(_ articles: [Article], total: Int) {
        if(currentPage == 1) {
            self.articles = []
            showedCellIndexes = []
        }
        
        self.articles.append(contentsOf: articles)
        totalArticles = total
        
        loadingMore = false
        tableRefreshControl.endRefreshing()
        articlesTable.hideFooterView()
        articlesTable.reloadData()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.defaultReuseIdentifier, for: indexPath) as! ArticleCell
        cell.setupData(article: article)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let articleUrl = articles[indexPath.row].url
        router.navigateToArticleWebDetail(articleUrl: articleUrl)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if !showedCellIndexes.contains(indexPath) {
            showedCellIndexes.append(indexPath)
            cell.animateOnDisplay()
        }
        
        
        if indexPath.row == articles.count - 1 && !loadingMore && articles.count < totalArticles {
            articlesTable.showFooterView()
            loadMoreData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}



































