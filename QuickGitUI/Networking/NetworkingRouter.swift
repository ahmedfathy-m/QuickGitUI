//
//  NetworkingRouter.swift
//  QuickGitUI
//
//  Created by Ahmed Samir on 03/11/2022.
//

import Foundation

protocol NetworkingRouter {
    var targetURL: URL? {get}
    var defaultMethod: HTTPMethod {get}
    var defaultBodyParameters: [String: String] {get}
    var defaultQueryParameters: [String: String] {get}
    var defaultHeaders: [String: String] {get}
}
