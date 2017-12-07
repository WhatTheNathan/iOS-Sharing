//
//  RepoTableViewDelagte.swift
//  GithubSearchDemo
//
//  Created by Nathan on 06/12/2017.
//  Copyright © 2017 Nathan. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return repos.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repoinfo", for: indexPath) as! RepoTableViewCell
        cell.repoInfo = repos[indexPath.section][indexPath.row]
        return cell
    }
}
