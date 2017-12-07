//
//  RepositoryInfo.swift
//  GithubSearchDemo
//
//  Created by Nathan on 04/12/2017.
//  Copyright © 2017 Nathan. All rights reserved.
//

import Foundation

class RepositoryInfo {
    var name: String
    var detail_url: URL
    var image_url: URL
    var description: String
    
    init(_ name: String,
         _ detail_url: URL,
         _ image_url: URL,
         _ description: String) {
        self.name = name
        self.detail_url = detail_url
        self.image_url = image_url
        self.description = description
    }
}
