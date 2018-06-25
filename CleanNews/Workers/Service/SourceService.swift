//
//  SourceService.swift
//  CleanNews
//
//  Created by Ulices Meléndez on 24/06/18.
//  Copyright © 2018 Ulices Meléndez Acosta. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON

protocol SourceServiceProtocol: class {
    func fetchSources(closure: @escaping ([Source]?, NSError?) -> Void) -> Void
}

class SourceService: SourceServiceProtocol {
    
    private let provider: MoyaProvider<SourceAPI> = MoyaProvider<SourceAPI>()
    
    func fetchSources(closure: @escaping ([Source]?, NSError?) -> Void) {
        provider.request(.fetchSources()) { result in
            switch result {
            case let .success(response):
                do {
                    let json = try JSON(data: response.data)
                    let sources = SourceMapper.getSources(json: json)
                    closure(sources, nil)
                } catch let error as NSError {
                    closure(nil, error)
                }
                
            case let .failure(error):
                closure(nil, error as NSError)
            }
        }
    }
}
