//
//  ViewController.swift
//  GithubSearchDemo
//
//  Created by Nathan on 04/12/2017.
//  Copyright © 2017 Nathan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    /// Model
    var repos: [[RepositoryInfo]] = []
    
    /// View
    @IBOutlet weak var repoNameTextField: UITextField!
    @IBOutlet weak var reposTableView: UITableView!
    
    /// Mark: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// 设置tableview的dataSource和deleagte
        self.reposTableView.delegate = self
        self.reposTableView.dataSource = self
        
        /// 设置repoNameTextField的delegate
        self.repoNameTextField.delegate = self
    }
    
    private func updateUI() {
        reposTableView.reloadData()
    }

    private func searchForGithub(repositoryName: String) {
        let url = "https://api.github.com/search/repositories"
        let parameters = ["q": repositoryName + " stars:>5000"]
        let _ = Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
            switch response.result {
            case .success(let result):
                let json = JSON(result)
//                print(json)
                self.repos.removeAll()
                self.repos.append(self.parseGithubResponse(responseJSON: json))
                self.updateUI()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func parseGithubResponse(responseJSON: JSON) -> [RepositoryInfo] {
        
        var repoinfos: [RepositoryInfo] = []
        
        /// parse total_count
        let totalCount = responseJSON["total_count"].intValue

        if totalCount != 0 {
            let items = responseJSON["items"].arrayValue
            for item in items {
                let name = item["name"].stringValue
                let detail_url =  URL(string: item["html_url"].stringValue)
                let image_url = URL(string: item["owner"]["avatar_url"].stringValue)
                let description = item["description"].stringValue
                
                let repoinfo = RepositoryInfo(name, detail_url!, image_url!, description)
                repoinfos.append(repoinfo)
            }
            return repoinfos
        }
        
        return []
    }
    
    /// Mark: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "repoDetail" {
            if let webVC = segue.destination as? WebViewController, let cell = sender as? RepoTableViewCell{
                webVC.webUrl = cell.repoInfo?.detail_url
            }
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchForGithub(repositoryName: textField.text!)
        textField.resignFirstResponder()
        return true
    }
}
