//
//  RepositoryResponse.swift
//  Repos
//
//  Created by Heba Nageh on 23/04/2021.
//

import Foundation


public struct RepositoryResponse: Codable {
    
    public var id: Int  { return _id ?? 0 }
    public var nodeId: String  { return _nodeId ?? "" }
    public var name: String  { return _name ?? "" }
    public var fullName: String  { return _fullName ?? "" }
    public var url: String  { return _url ?? "" }
    public var htmlUrl: String  { return _htmlUrl ?? "" }
    public var description: String  { return _description ?? "" }
    public var isPrivate: Bool  { return _isPrivate ?? false }
    public var fork: Bool  { return _fork ?? false }
    
    public var owner: OwnerResponse? {return _owner}

    private var _id: Int?
    private var _nodeId: String?
    private var _owner: OwnerResponse?
    private var _name: String?
    private var _fullName: String?
    private var _url: String?
    private var _htmlUrl: String?
    private var _description: String?
    private var _isPrivate: Bool?
    private var _fork: Bool?

    
    private enum CodingKeys : String, CodingKey {
        case _id = "id"
        case _owner = "owner"
        case _nodeId = "node_id"
        case _name = "name"
        case _fullName = "full_name"
        case _url = "url"
        case _htmlUrl = "html_url"
        case _description = "description"
        case _isPrivate = "private"
        case _fork = "fork"
    }

}

public struct OwnerResponse: Codable {
    
    public var id: Int  { return _id ?? 0 }
    public var nodeId: String  { return _nodeId ?? "" }
    public var login: String  { return _login ?? "" }
    public var avatarUrl: String  { return _avatarUrl ?? "" }
    public var gravatarId: String  { return _gravatarId ?? "" }
    public var url: String  { return _url ?? "" }
    public var type: String  { return _type ?? "" }
    public var siteAdmin: Bool  { return _siteAdmin ?? false }

    
    
    private var _id: Int?
    private var _nodeId: String?
    private var _login: String?
    private var _avatarUrl: String?
    private var _gravatarId: String?
    private var _url: String?
    private var _type: String?
    private var _siteAdmin: Bool?

    
    private enum CodingKeys: String, CodingKey {
        case _id = "id"
        case _nodeId = "node_id"
        case _login = "login"
        case _avatarUrl = "avatar_url"
        case _gravatarId = "gravatar_id"
        case _url = "url"
        case _type = "type"
        case _siteAdmin = "site_admin"
    }
}

public enum userType: String {

    public var type: String {
        return self.rawValue
    }
    
    case user = "User"
    case organization = "Organization"
}
