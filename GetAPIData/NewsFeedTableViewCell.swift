//
//  NewsFeedTableViewCell.swift
//  GetAPIData
//
//  Created by User on 03/09/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class NewsFeedTableViewCell: UITableViewCell {
    let article = Article()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var publishedAtLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    static let identifier = "NewsFeedTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func configure(object: Article) {
        self.titleLabel.text = object.title
        self.authorLabel.text = object.author
        self.publishedAtLabel.text = object.publishedAt
        self.contentLabel.text = object.content
    }
    
}
