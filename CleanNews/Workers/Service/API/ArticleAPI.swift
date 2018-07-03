//
//  ArticleAPI.swift
//  CleanNews
//
//  Created by Ulices Meléndez on 12/06/18.
//  Copyright © 2018 Ulices Meléndez Acosta. All rights reserved.
//

import Foundation
import Moya

enum ArticleAPI {
    case fetchTopHeadlinesByCategory(category: String, page: NSInteger)
    case fetchTopHeadlinesBySource(sourceId: String, page: NSInteger)
}

extension ArticleAPI: TargetType {
    
    var baseURL: URL {
        return URL(string: API.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .fetchTopHeadlinesByCategory, .fetchTopHeadlinesBySource:
            return "/top-headlines"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchTopHeadlinesByCategory:
            return .get
        case .fetchTopHeadlinesBySource:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data() //Test
    }
    
    var task: Task {
        switch self {
        case let .fetchTopHeadlinesByCategory(category, page):
            return .requestParameters(parameters: ["category": category, "page": page, "apiKey": API.key], encoding: URLEncoding.queryString)
        case let .fetchTopHeadlinesBySource(sourceId, page):
            return .requestParameters(parameters: ["sources": sourceId, "page": page, "apiKey": API.key], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    //    var parameters: [String: Any]? {
    //        switch self {
    //        case .fetchTopHeadlines(let category, let page):
    //            return ["category": category, "page": page, "apiKey": API.key]
    //        }
    //    }
}
