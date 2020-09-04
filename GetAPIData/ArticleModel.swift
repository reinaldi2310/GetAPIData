//
//  ArticleModel.swift
//  GetAPIData
//
//  Created by User on 02/09/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import ObjectMapper

struct Article {
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}

extension Article: Mappable {
    init?(map: Map) {
        self.init()
    }
    
    mutating func mapping(map: Map) {
        author <- map["author"]
        title <- map["title"]
        description <- map["description"]
        url <- map["url"]
        urlToImage <- map["urlToImage"]
        publishedAt <- map["publishedAt"]
        content <- map["content"]
    }
    
    
}
