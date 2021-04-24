//
//  GetAllReposRequest.swift
//  Repos
//
//  Created by Heba Nageh on 24/04/2021.
//

import Foundation


struct GetAllReposRequest: RequestType {

    typealias ResponseType = [RepositoryResponse]
    var data: RequestData = RequestData(path: "\(ServiceEnvironment.Domains.github)\(ServiceEnvironment.Path.getRepos)", method: .get)

}
