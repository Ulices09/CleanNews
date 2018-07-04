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
    var router: ArticleSourceListRoutingLogic!
    
    var articles: [Article] = []
    var currentPage = 1
    var totalArticles = 0
    var loadingMore = false
    var showedCellIndexes: [IndexPath] = []
    var sourceId: String!
    var sourceName: String!
    
    private var articlesTable: UITableView = UITableView()
    private var loadingView: UIView!
    
    lazy var tableRefreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(ArticleSourceListVC.refreshArticles(_:)), for: .valueChanged)
        refreshControl.tintColor = UIColor.white
        return refreshControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupViews()
        interactor.fetchArticles(sourceId: sourceId, page: currentPage, showLoadingView: true)
    }
    
    private func setup() {
        let viewController = self
        let interactor = ArticleSourceListInteractor()
        let presenter = ArticleSourceListPresenter()
        let serviceWorker = ArticleService()
        let router = ArticleSourceListRouter()
        
        viewController.interactor = interactor
        interactor.serviceWorker = serviceWorker
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.router = router
        router.viewController = viewController
    }
    
    private func setupViews() {
        title = sourceName
        navigationItem.largeTitleDisplayMode = .never
        setupTableView()
    }
    
    private func setupTableView() {
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
    
    @objc func refreshArticles(_ sender: Any) {
        currentPage = 1
        interactor.fetchArticles(sourceId: sourceId, page: currentPage, showLoadingView: false)
    }
    
    private func loadMoreData() {
        currentPage += 1
        loadingMore = true
        interactor.fetchArticles(sourceId: sourceId, page: currentPage, showLoadingView: false)
    }

}

extension ArticleSourceListVC: ArticleSourceListDisplayLogic {
    func displayArticles(_ articles: [Article], total: Int) {
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
        loadingView = displayLoadingView(view: view)
    }
    
    func hideLoading() {
        removeLoadinView(loadingView: loadingView)
    }
}

extension ArticleSourceListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let article = articles[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.defaultReuseIdentifier, for: indexPath) as! ArticleCell
        cell.setupData(article: article)
        return cell
    }
}

extension ArticleSourceListVC: UITableViewDelegate {
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








