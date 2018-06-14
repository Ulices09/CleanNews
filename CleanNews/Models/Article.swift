//
//  Article.swift
//  CleanNews
//
//  Created by Ulices Meléndez on 12/06/18.
//  Copyright © 2018 Ulices Meléndez Acosta. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Article {
    //var source: Source?
    var author: String?
    var title: String?
    var description: String
    var url: String
    var urlToImage: String
    var publishedAt: String

}

extension Article {

    init(json: JSON) {

        self.author = json["author"].stringValue
        self.title = json["title"].stringValue
        self.description = json["description"].stringValue
        self.url = json["url"].stringValue
        self.urlToImage = json["urlToImage"].stringValue
        self.publishedAt = json["publishedAt"].stringValue

//        if json["source"].exists() {
//            self.source = Source(json: json["source"])
//        }


    }
}
