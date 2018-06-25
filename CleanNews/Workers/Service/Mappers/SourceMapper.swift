//
//  SourceMapper.swift
//  CleanNews
//
//  Created by Ulices Meléndez on 24/06/18.
//  Copyright © 2018 Ulices Meléndez Acosta. All rights reserved.
//

import Foundation
import SwiftyJSON

class SourceMapper {
    
    static func getSources(json: JSON) -> [Source] {
        var sources = [Source]()
        
        if let jsonSources = json["sources"].array {
            for jsonArticle in jsonSources {
                let source = Source(json: jsonArticle)
                sources.append(source)
            }
        }
        
        return sources
    }
}
