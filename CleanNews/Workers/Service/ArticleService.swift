//
//  ArticleNetwork.swift
//  CleanNews
//
//  Created by Ulices Meléndez on 12/06/18.
//  Copyright © 2018 Ulices Meléndez Acosta. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON

protocol HeadlineServiceProtocol {
    func fetchTopHeadlinesByCategory(category: String, page: NSInteger, closure: @escaping ([Article]?, NSInteger, NSError?) -> Void ) -> Void
    func fetchTopHeadlinesBySource(sourceId: String, page: NSInteger, closure: @escaping ([Article]?, NSInteger, NSError?) -> Void ) -> Void
}

struct ArticleService: HeadlineServiceProtocol {
    
    private let provider: MoyaProvider<ArticleAPI> = MoyaProvider<ArticleAPI>()
    
    func fetchTopHeadlinesByCategory(category: String, page: NSInteger, closure: @escaping ([Article]?, NSInteger, NSError?) -> Void) {
        provider.request(.fetchTopHeadlinesByCategory(category: category, page: page)) { result in
            switch result {
            case let .success(response):
                do {
                    let json = try JSON(data: response.data)
                    let (articles, total) = ArticleMapper.getArticles(json: json)
                    closure(articles, total, nil)
                } catch let error as NSError{
                    closure(nil, 0, error)
                }
                
            case let .failure(error):
                closure(nil, 0, error as NSError)
            }
        }
    }
    
    func fetchTopHeadlinesBySource(sourceId: String, page: NSInteger, closure: @escaping ([Article]?, NSInteger, NSError?) -> Void) {
        provider.request(.fetchTopHeadlinesBySource(sourceId: sourceId, page: page)) { result in
            switch result {
            case let .success(response):
                do {
                    let json = try JSON(data: response.data)
                    let (articles, total) = ArticleMapper.getArticles(json: json)
                    closure(articles, total, nil)
                } catch let error as NSError{
                    closure(nil, 0, error)
                }
                
            case let .failure(error):
                closure(nil, 0, error as NSError)
            }
        }
    }
}
