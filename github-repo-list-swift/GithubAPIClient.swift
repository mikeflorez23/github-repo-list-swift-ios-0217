//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubAPIClient {
    
    class func getRepositories(with completion: @escaping ([[String:Any]]?) -> Void) {
        
        let urlStirng = "https://api.github.com/repositories?" + clientID + "&" + clientSecret

        if let url = URL(string: urlStirng) {
            
            let session = URLSession.shared
        
            let dataTask = session.dataTask(with: url, completionHandler: { (data, response, error) in
                
                if let unwrappedData = data {
                    
                    do {
                        
                        let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as? [[String:Any]] ?? [[:]]
                        
                            completion(responseJSON)
                        
                    } catch {
                        completion(nil)
                    }
                } else {
                    completion(nil)
                }
            })
            dataTask.resume()
        } else {
            completion(nil)
        }
    }
}
