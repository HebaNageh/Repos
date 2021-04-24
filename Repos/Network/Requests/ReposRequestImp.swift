//
//  ReposRequestImp.swift
//  Repos
//
//  Created by Heba Nageh on 24/04/2021.
//

import Foundation

class ReposRequestImp {
    
    static func getAllRepos() {
        
        GetAllReposRequest().execute(
            onSuccess: { (repos: [RepositoryResponse]) in
                #if DEBUG
                print(repos)
                #endif

                // Do something with the users. They are already typed!
            },
            onError: { (error: Error) in
                // Do something with the error.
            }
        )
    }
}
