//
//  RepoTableViewCell.swift
//  GithubSearchDemo
//
//  Created by Nathan on 05/12/2017.
//  Copyright © 2017 Nathan. All rights reserved.
//

import UIKit
import SDWebImage

class RepoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var repoImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var repoInfo: RepositoryInfo? {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        self.nameLabel.text = repoInfo?.name
        self.descriptionLabel.text = repoInfo?.description
        self.repoImage.sd_setImage(with: repoInfo?.image_url)
    }
}
