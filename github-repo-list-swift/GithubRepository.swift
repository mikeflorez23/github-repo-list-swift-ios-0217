//
//  FISGithubRepository.swift
//  github-repo-list-swift
//
//  Created by susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubRepository {
    
    var fullName: String
    var htmlURL: URL
    var repositoryID: String
    
    init?(dictionary: [String:Any]) {
        guard let fullName = dictionary["full_name"] as? String,
            let htmlURL = dictionary["html_url"] as? String,
            let repositoryID = dictionary["id"] as? Int else { return nil }
        self.fullName = fullName
        self.htmlURL = URL(string: htmlURL)!
        self.repositoryID = String(repositoryID)
    }
    
    
    
    
}
