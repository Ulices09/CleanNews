//
//  ArticleWebDetailVC.swift
//  CleanNews
//
//  Created by Ulices Meléndez on 22/06/18.
//  Copyright © 2018 Ulices Meléndez Acosta. All rights reserved.
//

import UIKit
import WebKit

class ArticleWebDetailVC: UIViewController, WKNavigationDelegate {

    var articleUrl: String?
    private var detailWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: articleUrl!)!
        detailWebView.load(URLRequest(url: url))
        detailWebView.allowsBackForwardNavigationGestures = true
    }

    override func loadView() {
        detailWebView = WKWebView()
        detailWebView.navigationDelegate = self
        view = detailWebView
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("finish")
    }
}
