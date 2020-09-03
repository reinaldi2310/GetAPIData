//
//  ViewController.swift
//  GetAPIData
//
//  Created by User on 02/09/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let newsFeed = NewsFeed()
    let article = [Article]()
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(NewsFeedTableViewCell.nib(), forCellReuseIdentifier: NewsFeedTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        getJSONData()
    }
    
    // TableView Func
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let articles = newsFeed.articles else {return 0}
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsFeedTableViewCell.identifier, for: indexPath) as! NewsFeedTableViewCell
        if let articles = newsFeed.articles {
            cell.configure(object: articles[indexPath.row])
        }
        return cell
    }
    
    func getJSONData() {
        let urlString = "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=926c62a1020e4e2d8cfb75561df6032b"
        let url = URL(string: urlString)
        
        guard url != nil else {
            return
        }
        let dataTask = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            if error == nil && data != nil {
                let decoder = JSONDecoder()
                do {
                    let newsFeed = try decoder.decode(NewsFeed.self, from: data!)
                    print(newsFeed)
                }
                catch{
                    print("Ooops...Something went wrong")
                }
            }
        }
        dataTask.resume()
    }
    
}
