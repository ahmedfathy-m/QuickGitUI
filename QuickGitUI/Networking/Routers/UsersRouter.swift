//
//  UsersRouter.swift
//  QuickGitUI
//
//  Created by Ahmed Samir on 03/11/2022.
//

import Foundation

enum UsersRouter {
    case allUsers(perPage: Int, pageNo: Int)
    case getAuthUser
    case updateAuthUser
    case someUser(login: String)
}

extension UsersRouter: NetworkingRouter {
    var targetURL: URL? {
        switch self {
        case .allUsers: return URL(string: "https://api.github.com/search/users")
        case .getAuthUser: return URL(string: "https://api.github.com/user")
        case .updateAuthUser: return URL(string: "https://api.github.com/user")
        case .someUser(let login): return URL(string: "https://api.github.com/users/\(login)")
        }
    }
    
    var defaultMethod: HTTPMethod {
        switch self {
        case .allUsers: return .get
        case .getAuthUser: return .get
        case .updateAuthUser: return .patch
        case .someUser: return .get
        }
    }
    
    var defaultBodyParameters: [String : String] {
        return [:]
    }
    
    var defaultQueryParameters: [String : String] {
        switch self {
        case .allUsers(let perPage, let pageNo): return ["per_page":"\(perPage)", "page":"\(pageNo)", "q":"repos:%3E42+followers:%3E1000"]
        case .getAuthUser: return [:]
        case .updateAuthUser: return [:]
        case .someUser: return [:]
        }
    }
    
    var defaultHeaders: [String : String] {
        return ["accept":"application/vnd.github+json"
                ,"Content-Type":"application/vnd.github+json"
//                ,"Authorization":"Bearer \(12)"
        ]
    }
    
    
}
