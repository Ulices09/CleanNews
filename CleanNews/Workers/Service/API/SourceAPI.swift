//
//  SourceAPI.swift
//  CleanNews
//
//  Created by Ulices Meléndez on 24/06/18.
//  Copyright © 2018 Ulices Meléndez Acosta. All rights reserved.
//

import Foundation
import Moya

enum SourceAPI {
    case fetchSources()
}

extension SourceAPI: TargetType {
    var baseURL: URL {
        return URL(string: API.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .fetchSources():
            return "/sources"
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .fetchSources():
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .fetchSources():
            return .requestParameters(parameters: ["apiKey": API.key], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}
