//
//  ArticleModel.swift
//  GetAPIData
//
//  Created by User on 02/09/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

struct Article: Codable {
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}

