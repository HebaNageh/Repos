//
//  ReposViewModel.swift
//  Repos
//
//  Created by Heba Nageh on 24/04/2021.
//

import Foundation
import PromiseKit

class ReposViewModel {

    private let request: ReposRequestImp
    init(request: ReposRequestImp) {
        self.request = request
    }

    func getAllRepos() -> Promise<[RepositoryResponse]> {
        return Promise { seal in
            firstly {
                request.getAllRepos()
            }.done { (res) in
                seal.fulfill(res)
            }.ensure {
            }.catch { (error) in
                seal.reject(error)
            }
        }
    }
}
