//
//  DataModel.swift
//  GetAPIData
//
//  Created by User on 02/09/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import ObjectMapper

struct NewsFeed {
    var status: String = ""
    var totalResults: Int = 0
    var articles: [Article] = []
}

extension NewsFeed: Mappable {
    init?(map: Map) {
        self.init()
    }
    
    mutating func mapping(map: Map) {
        status <- map["status"]
        totalResults <- map["totalResults"]
        articles <- map["articles"]
    }

}





