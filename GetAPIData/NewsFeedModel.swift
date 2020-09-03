//
//  DataModel.swift
//  GetAPIData
//
//  Created by User on 02/09/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

struct NewsFeed: Codable {
    var status: String = ""
    var totalResults: Int = 0
    var articles: [Article]?
}
