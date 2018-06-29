//
//  ArticleWebDetailVC.swift
//  CleanNews
//
//  Created by Ulices Meléndez on 22/06/18.
//  Copyright © 2018 Ulices Meléndez Acosta. All rights reserved.
//

import UIKit
import WebKit

class ArticleWebDetailVC: UIViewController {

    var articleUrl: String?
    private var detailWebView: WKWebView!
    private var loadingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    override func loadView() {
        detailWebView = WKWebView()
        detailWebView.navigationDelegate = self
        view = detailWebView
    }
    
    private func setupViews() {
        navigationItem.largeTitleDisplayMode = .never
        let url = URL(string: articleUrl!)!
        detailWebView.load(URLRequest(url: url))
        detailWebView.allowsBackForwardNavigationGestures = true
    }
    
}

extension ArticleWebDetailVC: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        loadingView = displayLoadingView(view: view)
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        removeLoadinView(loadingView: loadingView)
    }
 
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("finish")
    }
}
