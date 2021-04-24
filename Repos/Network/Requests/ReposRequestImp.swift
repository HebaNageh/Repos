//
//  ReposRequestImp.swift
//  Repos
//
//  Created by Heba Nageh on 24/04/2021.
//

import Foundation
import PromiseKit

class ReposRequestImp {
    
    public func getAllRepos() -> Promise<[RepositoryResponse]>{
        return Promise { seal in
            GetAllReposRequest().execute(
                onSuccess: { (repos: [RepositoryResponse]) in
                    #if DEBUG
                    print(repos)
                    #endif
                    seal.fulfill(repos)
                },
                onError: { (error: Error) in
                    seal.reject(error)
                }
            )
        }
    }
}
