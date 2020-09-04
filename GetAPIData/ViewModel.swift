//
//  ViewModel.swift
//  GetAPIData
//
//  Created by User on 04/09/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class ViewModel {
    let urlString = "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=926c62a1020e4e2d8cfb75561df6032b"
    var article = [Article]()
    
    func getJSONData(succesHandler: @escaping() -> Void) {
        AF.request(urlString).responseJSON { (response) in
            if let value = response.value {
                let successResponse = Mapper<NewsFeed>().map(JSONObject: value)
                let articles = successResponse?.articles
                self.article = articles ?? []
                succesHandler()
                print("Success")
            }
            else if let _ = response.error{
                print("Failure in API End Point")
            }
        }
       
    }

}
