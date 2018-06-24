//
//  Source.swift
//  CleanNews
//
//  Created by Ulices Meléndez on 12/06/18.
//  Copyright © 2018 Ulices Meléndez Acosta. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Source {
    var id: String?
    var name: String!
    var description: String?
    var url: String?
    var category: String?
    var language: String?
    var country: String?
}

extension Source {

    init(json: JSON) {
        self.name = json["name"].stringValue
        if let id = json["id"].string { self.id = id }
    }
}
