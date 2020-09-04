//
//  ViewController.swift
//  GetAPIData
//
//  Created by User on 02/09/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let viewModel = ViewModel()
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "News Feed"
        tableView.register(NewsFeedTableViewCell.nib(), forCellReuseIdentifier: NewsFeedTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        getNewsFeed()
        setupRefreshButton()
    }
    
    private func setupRefreshButton() {
        let refreshButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(onTapRefreshButton))
        navigationItem.rightBarButtonItem = refreshButton
    }
    
    @objc func onTapRefreshButton() {
        getNewsFeed()
    }
    
    func getNewsFeed() {
        viewModel.getJSONData(succesHandler: reloadTable)
    }
    private func reloadTable() {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.article.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsFeedTableViewCell.identifier, for: indexPath) as! NewsFeedTableViewCell
        cell.configure(object: viewModel.article[indexPath.row])
        return cell
    }

    
}
