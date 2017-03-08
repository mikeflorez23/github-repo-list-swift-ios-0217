//
//  FISReposDataStore.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposDataStore {
    
    static let sharedInstance = ReposDataStore()
    
    var repositories: [GithubRepository] = []
    
    func getRepositoriesFromAPI(_ completion: @ escaping () -> Void) {
        
        repositories.removeAll()
        
        GithubAPIClient.getRepositories { (repos) in
            
            
            guard let repos = repos else { completion(); return }
            
            for repo in repos {
                
                guard let createdRepo = GithubRepository(dictionary: repo) else { continue }
                
                print("We have a repo = \(createdRepo)")
                
                self.repositories.append(createdRepo)
            }
            
            completion()
        }
    }
}




