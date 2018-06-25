//
//  ArticleMapper.swift
//  CleanNews
//
//  Created by Ulices Meléndez on 13/06/18.
//  Copyright © 2018 Ulices Meléndez Acosta. All rights reserved.
//

import Foundation
import SwiftyJSON

class ArticleMapper {
    
    static func getArticles(json: JSON) -> ([Article], Int) {

        var articles = [Article]()
        let total = getTotal(json: json)

        if let jsonArticles = json["articles"].array {

            for jsonArticle in jsonArticles {

                let article = Article(json: jsonArticle)
                articles.append(article)
            }
        }

        return (articles, total)
    }

    private static func getTotal(json: JSON) -> Int {

        var total = 0

        if let totalResult = json["totalResults"].int {
            total = totalResult
        }

        return total
    }
}
